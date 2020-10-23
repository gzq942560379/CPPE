#include "FuncPtrPass.h"

void FuncPtrPass::ProcessPHINode(const PHINode *phi, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
#ifdef DEBUG
    phi->dump();
#endif
    set<Function *> *funcSet = nullptr;
    if (from == nullptr)
    {
        funcSet = new set<Function *>();
    }
    else
    {
        Value *val = phi->getIncomingValueForBlock(from);
        funcSet = getFunctionSetFromValue(val, funcFrame);
    }
    basicBlockframe.updateVarWithFunctionSet(phi, funcSet);
}

void FuncPtrPass::ProcessCallbase(const CallBase *call, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
    Value *calledOperand = call->getCalledOperand();
    if (calledOperand->getName().startswith("llvm.dbg."))
        return;
#ifdef DEBUG
    call->dump();
#endif
    set<Function *> *funcSet = getFunctionSetFromValue(calledOperand, funcFrame);

    if (funcSet->empty())
    {
#ifdef DEBUG
        errs() << "call null \n";
#endif
    }
    else
    {
        // 处理所有可能的函数
        for (auto f : *funcSet)
        {
            // 添加到output
            updateOutput(call->getDebugLoc().getLine(), f);

            // 初始化参数
            auto argsMap = initArgsMap(call, f, funcFrame);
            // 处理函数
            TraverseFunc(*f, argsMap, &funcFrame);
            // 处理返回值
            if (isFunctionPointer(call))
            {
                assert(funcFrame.lastCallReturnVal != nullptr && "lastCallReturnVal should not be null !!!");
                basicBlockframe.updateVarWithFunctionSet(call, funcFrame.lastCallReturnVal);
                funcFrame.lastCallReturnVal = nullptr;
            }
        }
    }
    delete funcSet;
}

void FuncPtrPass::ProcessReturnInst(const ReturnInst *retInst, FunctionFrame &funcFrame)
{
#ifdef DEBUG
    retInst->dump();
#endif
    auto retVal = retInst->getOperand(0);
    auto funcSet = getFunctionSetFromValue(retVal, funcFrame);
    funcFrame.returnVal(funcSet);
}

void FuncPtrPass::ProcessBasicBlock(BasicBlock &bb, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
#ifdef DEBUG
    // bb.dump();
#endif
    for (Instruction &inst : bb)
    {
        Type *type = inst.getType();
        // 处理结果为函数指针PHINode
        if (isa<PHINode>(inst) && isFunctionPointer(&inst))
            ProcessPHINode(dyn_cast<PHINode>(&inst), from, funcFrame, basicBlockframe);
        // 处理所有函数调用CallBase
        if (isa<CallBase>(inst))
            ProcessCallbase(dyn_cast<CallBase>(&inst), funcFrame, basicBlockframe);
        // 处理返回函数指针的ReturnInst
        if (isa<ReturnInst>(inst) && inst.getNumOperands() > 0 && isFunctionPointer(inst.getOperand(0)))
        {
            auto retInst = dyn_cast<ReturnInst>(&inst);
        }
    }
}

void FuncPtrPass::DeepFirstTraverseCFG(BasicBlock &bb, BasicBlock *from)
{
    BasicBlockFrame *basicBlockFrame = new BasicBlockFrame(&bb);
    funcStack.back()->bbStack.push_back(basicBlockFrame);

    // Process BB
    ProcessBasicBlock(bb, from, *funcStack.back(), *basicBlockFrame);
    // Deep first Traverse BB
    auto TInst = bb.getTerminator();
    for (unsigned I = 0; I < TInst->getNumSuccessors(); ++I)
    {
        BasicBlock *Succ = TInst->getSuccessor(I);
        DeepFirstTraverseCFG(*Succ, &bb);
    }
    funcStack.back()->bbStack.pop_back();
    delete basicBlockFrame;
}

void FuncPtrPass::TraverseFunc(Function &func, map<const Argument *, set<Function *> *> *argsMap, FunctionFrame *callerFrame)
{
    FunctionFrame *functionFrame = new FunctionFrame(&func, argsMap, callerFrame);
    funcStack.push_back(functionFrame);
    DeepFirstTraverseCFG(func.getBasicBlockList().front(), 0);
    funcStack.pop_back();
    delete functionFrame;
}

void FuncPtrPass::updateOutput(int line, Function *func)
{
    if (outputMap.find(line) == outputMap.end())
        outputMap.insert(std::make_pair(line, new set<Function *>()));
    outputMap[line]->insert(func);
#ifdef DEBUG
    errs()
        << "Update Output : " << line << " -> " << func->getName() << "\n";
#endif
}

void FuncPtrPass::output() const
{
    for (auto p : outputMap)
    {
        errs() << p.first << " : ";
        bool isFirst = true;
        for (auto f : *p.second)
        {
            if (isFirst)
            {
                errs() << f->getName();
                isFirst = false;
            }
            else
            {
                errs() << ", " << f->getName();
            }
        }
        errs() << "\n";
    }
}

map<const Argument *, set<Function *> *> *FuncPtrPass::initArgsMap(const CallBase *call, const Function *func, FunctionFrame &callerFuncFrame)
{
    auto argsMap = new map<const Argument *, set<Function *> *>();
    for (unsigned int i = 0; i < call->getNumArgOperands(); i++)
    {
        Value *argOperand = call->getArgOperand(i);
        // 只处理函数或函数指针
        if (isa<Function>(argOperand) || FuncPtrPass::isFunctionPointer(argOperand))
        {
            auto funcSet = getFunctionSetFromValue(argOperand, callerFuncFrame);
            argsMap->insert(std::make_pair(func->getArg(i), funcSet));
        }
    }
    return argsMap;
}

set<Function *> *FuncPtrPass::getFunctionSetFromValue(Value *value, FunctionFrame &funcFrame)
{
    set<Function *> *ret = new set<Function *>();
    // 如果是函数 直接赋值
    if (isa<Function>(value))
    {
        ret->insert(dyn_cast<Function>(value));
    }
    // 如果是函数指针 推测可能的函数集合
    else if (FuncPtrPass::isFunctionPointer(value) && !isa<ConstantPointerNull>(value))
    {
        // 搜索函数指针可能的函数集合
        set<Function *> *funcSet = nullptr;
        // 函数参数
        if (isa<Argument>(value))
        {
            auto arg = dyn_cast<Argument>(value);
            assert(funcFrame.argsMap->find(arg) != funcFrame.argsMap->end() && "should find arg in argsMap!!!");
            funcSet = funcFrame.argsMap->at(arg);
        }
        // 局部变量
        else
        {
            for (auto it = funcFrame.bbStack.rbegin(); it != funcFrame.bbStack.rend(); it++)
            {
                BasicBlockFrame *bbFrame = *it;
                if (bbFrame->varsMap.find(value) != bbFrame->varsMap.end())
                {
                    funcSet = bbFrame->varsMap[value];
                }
            }
        }
        for (auto f : *funcSet)
        {
            ret->insert(f);
        }
    }
    return ret;
}

bool FuncPtrPass::isFunctionPointer(const Value *value)
{
    return value->getType()->isPointerTy() && value->getType()->getPointerElementType()->isFunctionTy();
}

char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

void BasicBlockFrame::updateVarWithFunctionSet(const Value *val, set<Function *> *funcSet)
{
    assert(funcSet != nullptr && "local variable function set is not null !!!");
    varsMap.insert(std::make_pair(val, funcSet));
#ifdef DEBUG
    errs() << "Local Variable : " << val->getName() << " -> { ";
    for (auto f : *funcSet)
    {
        errs() << f->getName() << ", ";
    }
    errs() << "}\n";
#endif
}

int BasicBlockFrame::counter = 0;

void FunctionFrame::updateArgWithFunctionSet(const Argument *arg, set<Function *> *funcSet)
{
    assert(funcSet != nullptr && "args function set is not null !!!");
    argsMap->insert(std::make_pair(arg, funcSet));
#ifdef DEBUG
    errs() << "Function Arg : " << arg->getArgNo() << " -> { ";
    for (auto f : *funcSet)
    {
        errs() << f->getName() << ", ";
    }
    errs() << "}\n";
#endif
}
