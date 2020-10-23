#include "FuncPtrPass.h"
void FuncPtrPass::ProcessPHINode(const PHINode *phi, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
    string phiName = phi->getName();
    phi->dump();

    if (from == nullptr)
    {
        basicBlockframe.updateVar(phiName, nullptr);
#ifdef DEBUG
        errs() << phiName << " -> null\n";
        return;
#endif
    }

    Value *val = phi->getIncomingValueForBlock(from);
    // 如果是函数 直接赋值
    if (isa<Function>(val))
    {
        basicBlockframe.updateVar(phiName, dyn_cast<Function>(val));
#ifdef DEBUG
        errs() << phiName << " -> " << val->getName() << "\n";
#endif
    }
    // 如果是函数指针 推测可能的函数集合
    else if (val->getType()->isPointerTy() && val->getType()->getPointerElementType()->isFunctionTy())
    {
        // 空指针初始化 可能的函数集合为空集
        if (isa<ConstantPointerNull>(val))
        {
            basicBlockframe.updateVar(phiName, nullptr);
#ifdef DEBUG
            errs() << phiName << " -> null\n";
#endif
        }
        else
        {
            // 搜索函数指针可能的函数集合
            set<Function *> *functions = searchVer(val, funcFrame);
            if (functions->empty())
            {
                basicBlockframe.updateVar(phiName, nullptr);
#ifdef DEBUG
                errs() << phiName << " -> null\n";
#endif
            }
            else
            {
                for (auto f : *functions)
                {
                    basicBlockframe.updateVar(phiName, f);
#ifdef DEBUG
                    errs() << phiName << " -> " << val->getName() << " -> " << f->getName() << "\n";
#endif
                }
            }
        }
    }
    else
    {
    }
}

void FuncPtrPass::ProcessCallbase(const CallBase *call, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
    Value *calledOperand = call->getCalledOperand();
    if (calledOperand->getName().startswith("llvm.dbg."))
        return;
    call->dump();
    // 如果是函数 直接递归调用
    if (isa<Function>(calledOperand))
    {
        auto func = dyn_cast<Function>(calledOperand);
        // 添加到output
        updateOutput(call->getDebugLoc().getLine(), func);
#ifdef DEBUG
        errs()
            << "direct Output : " << call->getDebugLoc().getLine() << " -> " << func->getName() << "\n";
#endif
        // 考虑传递参数 INIT argsMap
        map<string, set<Function *>> *argsMap = new map<string, set<Function *>>();
        for (unsigned int i = 0; i < call->getNumArgOperands(); i++)
        {
            Value *argOperand = call->getArgOperand(i);
            string argOperandName = argOperand->getName();
            string argNo = Twine(i).str();
            // 只处理函数指针类型参数
            // 函数 直接传递
            if (isa<Function>(argOperand))
            {
                auto funcArgOperand = dyn_cast<Function>(argOperand);
                argsMap->insert(std::make_pair(argNo, set<Function *>{funcArgOperand}));
#ifdef DEBUG
                errs() << "func args : " << func->getName() << ":" << argNo << " -> " << argOperandName << "\n";
#endif
            }
            // 函数指针 推测所有可能值
            else if (argOperand->getType()->isPointerTy() && argOperand->getType()->getPointerElementType()->isFunctionTy())
            {
                // ArgOperand 可能是 局部变量 也可能是函数参数
                set<Function *> *functions = searchVer(argOperand, funcFrame);

                argsMap->insert(std::make_pair(argNo, set<Function *>()));
                if (functions->empty())
                {
#ifdef DEBUG
                    errs() << "func args : " << func->getName() << ":" << argNo << " -> " << argOperandName << " -> null \n";
#endif
                }
                else
                {
                    for (auto f : *functions)
                    {
                        argsMap->at(argNo).insert(f);
#ifdef DEBUG
                        errs() << "func args : " << func->getName() << ":" << argNo << " -> " << argOperandName << " -> " << f->getName() << "\n";
#endif
                    }
                }
            }
        }
        // 处理函数
        TraverseFunc(*func, argsMap);
        // 处理返回值
        // !TODO
    }
    // 如果是函数指针 则调用所有可能值
    else if (calledOperand->getType()->isPointerTy() && calledOperand->getType()->getPointerElementType()->isFunctionTy())
    {
        // 获取函数指针可能的函数集合 局部变量 函数参数 全局变量
        set<Function *> *functions = searchVer(calledOperand, funcFrame);

        if (functions->empty())
        {
#ifdef DEBUG
            errs() << "call null \n";
#endif
        }
        else
        {
            // 处理所有可能的函数
            for (auto f : *functions)
            {
                // 添加到output
                updateOutput(call->getDebugLoc().getLine(), f);
#ifdef DEBUG
                errs()
                    << "Update Output : " << call->getDebugLoc().getLine() << " -> " << f->getName() << "\n";
#endif
                TraverseFunc(*f, new map<string, set<Function *>>());
            }
            // 如果返回值是函数指针 计算所有可能的函数指针
        }
    }
    else
    {
        llvm_unreachable("called should be function or function pointer!!!");
    }
}

void FuncPtrPass::ProcessBasicBlock(BasicBlock &bb, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe)
{
    for (Instruction &inst : bb)
    {
        Type *type = inst.getType();
        // 处理函数指针PHINode
        if (isa<PHINode>(inst) && type->isPointerTy() && type->getPointerElementType()->isFunctionTy())
            ProcessPHINode(dyn_cast<PHINode>(&inst), from, funcFrame, basicBlockframe);

        if (isa<CallBase>(inst))
        {
            ProcessCallbase(dyn_cast<CallBase>(&inst), funcFrame, basicBlockframe);
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

void FuncPtrPass::TraverseFunc(Function &func, map<string, set<Function *>> *argsMap)
{
    FunctionFrame *functionFrame = new FunctionFrame(&func, argsMap);
    funcStack.push_back(functionFrame);
    DeepFirstTraverseCFG(func.getBasicBlockList().front(), 0);
    funcStack.pop_back();
    delete functionFrame;
}

void FuncPtrPass::updateOutput(int line, Function *func)
{
    if (outputMap.find(line) == outputMap.end())
        outputMap.insert(std::make_pair(line, set<Function *>()));
    outputMap[line].insert(func);
}

void FuncPtrPass::output() const
{
    for (auto p : outputMap)
    {
        errs() << p.first << " : ";
        bool isFirst = true;
        for (auto f : p.second)
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

set<Function *> *FuncPtrPass::searchVer(Value *val, FunctionFrame &funcFrame) const
{
    set<Function *> *functions = nullptr;
    // 函数参数
    if (isa<Argument>(val))
    {
        auto arg = dyn_cast<Argument>(val);
        string argNo = Twine(arg->getArgNo()).str();
        int size = funcFrame.argsMap->size();
        assert(funcFrame.argsMap->find(argNo) != funcFrame.argsMap->end() && "should find arg in argsMap!!!");
        functions = &(funcFrame.argsMap->at(argNo));
    }
    // 局部变量
    else
    {
        functions = funcFrame.searchVar(val->getName());
    }
    return functions;
}

char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

void BasicBlockFrame::updateVar(const string varName, Function *func)
{
    if (varsMap.find(varName) == varsMap.end())
        varsMap.insert(std::make_pair(varName, set<Function *>()));
    if (func != nullptr)
        varsMap[varName].insert(func);
}

set<Function *> *FunctionFrame::searchVar(string varName)
{
    // 从后往前在bbStack中搜索var
    for (auto it = bbStack.rbegin(); it != bbStack.rend(); it++)
    {
        BasicBlockFrame *bbFrame = *it;
        if (bbFrame->varsMap.find(varName) != bbFrame->varsMap.end())
        {
            return &bbFrame->varsMap[varName];
        }
    }

    llvm_unreachable(Twine("must find a var !!! -> " + varName).str().data());
    return nullptr;
}
