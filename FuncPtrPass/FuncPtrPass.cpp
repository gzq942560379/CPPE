#include "FuncPtrPass.h"

void FuncPtrPass::ProcessPHINode(const PHINode *phi, const BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
#ifdef DEBUG
    phi->dump();
#endif
    set<const Function *> *funcSet = nullptr;
    if (from == nullptr)
    {
        funcSet = new set<const Function *>();
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
    set<const Function *> *funcSet = getFunctionSetFromValue(calledOperand, funcFrame);
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
            // 如果只有声明没有实现
            if (!f->isDeclaration())
            {
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
    }
    delete funcSet;
}

void FuncPtrPass::ProcessReturnInst(const ReturnInst *reinst, FunctionFrame &funcFrame)
{
#ifdef DEBUG
    reinst->dump();
#endif
    auto retVal = reinst->getOperand(0);
    auto funcSet = getFunctionSetFromValue(retVal, funcFrame);
    funcFrame.returnVal(funcSet);
}

void FuncPtrPass::ProcessICmpInst(const ICmpInst *icmpInst, BasicBlockFrame &basicBlockframe)
{
    auto predicate = icmpInst->getPredicate();
    assert(icmpInst->getNumOperands() == 2 && "cmp instruction should have 2 operands !!!");
    auto op1 = icmpInst->getOperand(0);
    auto op2 = icmpInst->getOperand(1);
    if (isa<ConstantInt>(op1) && isa<ConstantInt>(op2))
    {
#ifdef DEBUG
        icmpInst->dump();
#endif
        auto constant1 = dyn_cast<ConstantInt>(op1);
        auto constant2 = dyn_cast<ConstantInt>(op2);
        if (predicate == ICmpInst::ICMP_EQ)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getSExtValue() == constant2->getSExtValue());
        else if (predicate == ICmpInst::ICMP_NE)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getSExtValue() != constant2->getSExtValue());
        else if (predicate == ICmpInst::ICMP_SGT)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getSExtValue() > constant2->getSExtValue());
        else if (predicate == ICmpInst::ICMP_SLT)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getSExtValue() < constant2->getSExtValue());
        else if (predicate == ICmpInst::ICMP_SGE)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getSExtValue() >= constant2->getSExtValue());
        else if (predicate == ICmpInst::ICMP_SLE)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getSExtValue() <= constant2->getSExtValue());
        else if (predicate == ICmpInst::ICMP_UGT)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getZExtValue() > constant2->getZExtValue());
        else if (predicate == ICmpInst::ICMP_ULT)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getZExtValue() < constant2->getZExtValue());
        else if (predicate == ICmpInst::ICMP_UGE)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getZExtValue() >= constant2->getZExtValue());
        else if (predicate == ICmpInst::ICMP_ULE)
            basicBlockframe.updateConditionValWithBool(icmpInst, constant1->getZExtValue() <= constant2->getZExtValue());
        else
            llvm_unreachable("no possible to here !!!");
    }
}

void FuncPtrPass::ProcessBasicBlock(const BasicBlock &bb, const BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
#ifdef DEBUG
    // bb.dump();
#endif
    for (auto &inst : bb)
    {
        Type *type = inst.getType();
        // 处理结果为函数指针PHINode
        if (isa<PHINode>(inst) && isFunctionPointer(&inst))
            ProcessPHINode(dyn_cast<PHINode>(&inst), from, funcFrame, basicBlockframe);
        // 处理所有函数调用CallBase
        if (isa<CallBase>(inst))
            ProcessCallbase(dyn_cast<CallBase>(&inst), funcFrame, basicBlockframe);
        // 处理返回函数指针的ReturnInst
        if (isa<ReturnInst>(inst) && inst.getNumOperands() > 0 && isFunctionPointer(inst.getOperand(0)) && funcFrame.callerFrame != nullptr)
            ProcessReturnInst(dyn_cast<ReturnInst>(&inst), funcFrame);
        // 处理永真永假条件判断
        if (isa<ICmpInst>(inst))
            ProcessICmpInst(dyn_cast<ICmpInst>(&inst), basicBlockframe);
    }
}

void FuncPtrPass::processTerminator(const Instruction *inst, const BasicBlock &bb)
{
    // 如果是BranchInst 且条件变量永真或永假 遍历对应分支
    if (isa<BranchInst>(inst) && inst->getNumSuccessors() > 1 && hasBoolValueforCmpInst(dyn_cast<CmpInst>(dyn_cast<BranchInst>(inst)->getCondition()), *funcStack.back()))
    {
        auto boolVal = getBoolValueFromCmpInst(dyn_cast<CmpInst>(dyn_cast<BranchInst>(inst)->getCondition()), *funcStack.back());
#ifdef DEBUG
        inst->dump();
        errs() << "Condition Always " << (boolVal ? "true" : "false") << "\n";
#endif
        auto nextBasicBlock = inst->getSuccessor(boolVal ? 0 : 1);
        if (funcStack.back()->colors[nextBasicBlock] == -1 || funcStack.back()->colors[nextBasicBlock] == 1) // 树边 、 前向边 或 横跨边 // 继续深度优先遍历
            DeepFirstTraverseCFG(*nextBasicBlock, &bb);
        else if (funcStack.back()->colors[nextBasicBlock] == 0) // 回边 //退出深度优先遍历
            ;                                                   // do nothing
        else
            llvm_unreachable("color should be -1, 0, 1 !!!");
    }
    // 否则遍历所有分支
    else
    {
        for (unsigned I = 0; I < inst->getNumSuccessors(); ++I)
        {
            auto nextBasicBlock = inst->getSuccessor(I);
            if (funcStack.back()->colors[nextBasicBlock] == -1 || funcStack.back()->colors[nextBasicBlock] == 1) // 树边 、 前向边 或 横跨边 // 继续深度优先遍历
                DeepFirstTraverseCFG(*nextBasicBlock, &bb);
            else if (funcStack.back()->colors[nextBasicBlock] == 0) // 回边 //退出深度优先遍历
                ;                                                   // do nothing
            else
                llvm_unreachable("color should be -1, 0, 1 !!!");
        }
    }
}

void FuncPtrPass::DeepFirstTraverseCFG(const BasicBlock &bb, const BasicBlock *from)
{
    // 入栈的点染色 0
    funcStack.back()->colors[&bb] = 0;
    // 创建新的BasicBlockFrame
    BasicBlockFrame *basicBlockFrame = new BasicBlockFrame(&bb);
    // 入栈
    funcStack.back()->bbStack.push_back(basicBlockFrame);

    // Process BB
    ProcessBasicBlock(bb, from, *funcStack.back(), *basicBlockFrame);
    // 处理Terminator,深度优先遍历BasicBlock
    processTerminator(bb.getTerminator(), bb);

    // 出栈
    funcStack.back()->bbStack.pop_back();
    // 销毁新的BasicBlockFrame
    delete basicBlockFrame;
    // 出栈的点染色 1
    funcStack.back()->colors[&bb] = 1;
}

void FuncPtrPass::TraverseFunc(const Function &func, map<const Argument *, set<const Function *> *> *argsMap, FunctionFrame *callerFrame)
{
    FunctionFrame *functionFrame = new FunctionFrame(&func, argsMap, callerFrame);
    funcStack.push_back(functionFrame);
    DeepFirstTraverseCFG(func.getBasicBlockList().front(), 0);
    funcStack.pop_back();
    delete functionFrame;
}

void FuncPtrPass::updateOutput(int line, const Function *func)
{
    if (outputMap.find(line) == outputMap.end())
        outputMap.insert(std::make_pair(line, new set<const Function *>()));
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

map<const Argument *, set<const Function *> *> *FuncPtrPass::initArgsMap(const CallBase *call, const Function *func, FunctionFrame &callerFuncFrame)
{
    auto argsMap = new map<const Argument *, set<const Function *> *>();
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

set<const Function *> *FuncPtrPass::getFunctionSetFromValue(const Value *value, FunctionFrame &funcFrame)
{
    set<const Function *> *ret = new set<const Function *>();
    // 如果是函数 直接赋值
    if (isa<Function>(value))
    {
        ret->insert(dyn_cast<Function>(value));
    }
    // 如果是函数指针 推测可能的函数集合
    else if (FuncPtrPass::isFunctionPointer(value) && !isa<ConstantPointerNull>(value))
    {
        // 搜索函数指针可能的函数集合
        set<const Function *> *funcSet = nullptr;
        // 函数参数
        if (isa<Argument>(value))
        {
            auto arg = dyn_cast<Argument>(value);
            // 如果初始化过
            if (funcFrame.argsMap->find(arg) != funcFrame.argsMap->end())
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
        // 没有找到
        if (funcSet != nullptr)
        {
            for (auto f : *funcSet)
            {
                ret->insert(f);
            }
        }
    }
    return ret;
}

bool FuncPtrPass::hasBoolValueforCmpInst(const CmpInst *cmpInst, FunctionFrame &funcFrame)
{
    for (auto it = funcFrame.bbStack.rbegin(); it != funcFrame.bbStack.rend(); it++)
    {
        auto bbFrame = *it;
        if (bbFrame->condVerMap.find(cmpInst) != bbFrame->condVerMap.end())
        {
            return true;
        }
    }
    return false;
}

bool FuncPtrPass::getBoolValueFromCmpInst(const CmpInst *cmpInst, FunctionFrame &funcFrame)
{
    assert(hasBoolValueforCmpInst(cmpInst, funcFrame) && "should have bool value for the cmp instruct !!!");
    for (auto it = funcFrame.bbStack.rbegin(); it != funcFrame.bbStack.rend(); it++)
    {
        BasicBlockFrame *bbFrame = *it;
        if (bbFrame->condVerMap.find(cmpInst) != bbFrame->condVerMap.end())
        {
            return bbFrame->condVerMap[cmpInst];
        }
    }
    llvm_unreachable("no possible to here !!!");
}

bool FuncPtrPass::isFunctionPointer(const Value *value)
{
    return value->getType()->isPointerTy() && value->getType()->getPointerElementType()->isFunctionTy();
}

char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

void BasicBlockFrame::updateVarWithFunctionSet(const Value *val, set<const Function *> *funcSet)
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

void BasicBlockFrame::updateConditionValWithBool(const CmpInst *cmpInst, bool boolVal)
{
    condVerMap.insert(std::make_pair(cmpInst, boolVal));
#ifdef DEBUG
    errs() << "Local Condition Variable : " << cmpInst->getName() << " -> " << (boolVal ? "true" : "false") << "\n";
#endif
}

#ifdef DEBUG
int BasicBlockFrame::counter = 0;
#endif

void FunctionFrame::updateArgWithFunctionSet(const Argument *arg, set<const Function *> *funcSet)
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
