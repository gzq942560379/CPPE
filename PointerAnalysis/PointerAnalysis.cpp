#include "PointerAnalysis.h"

void PointerAnalysisVisitor::ProcessCallBase(const CallBase *call)
{
#ifdef DEBUG
    call->dump();
#endif
    auto calledOperandSet = GetAlias(call->getCalledOperand());

    set<const Value *> valSet;

    for (auto calledOperand : calledOperandSet)
    {
        if (auto func = dyn_cast<Function>(calledOperand))
        {
            if (func->getName().startswith("llvm.memset."))
            {
                return;
            }
            if (func->getName().startswith("llvm.memcpy."))
            {
                ProcessCallMemcpy(call);
                return;
            }

            // 添加到output
            updateOutput(call->getDebugLoc().getLine(), func);

            if (func->getName().startswith("malloc"))
            {
                UpdateToDataFlow(call, &valSet);
                return;
            }
            else // 自定义函数
            {
                // 初始化参数
                map<const Argument *, set<const Value *> *> argsMap;
                for (unsigned int i = 0; i < call->getNumArgOperands(); i++)
                {
                    auto argsAliasSet = new set<const Value *>();
                    auto passedVarSet = GetAlias(call->getArgOperand(i));
                    argsAliasSet->insert(passedVarSet.begin(), passedVarSet.end());
                    argsMap.insert(std::make_pair(func->getArg(i), argsAliasSet));
#ifdef DEBUG
                    errs() << "Init Argment : ------------------------------\n";
                    func->getArg(i)->dump();
                    errs() << " -> \n";
                    for (auto value : *argsAliasSet)
                    {
                        value->dump();
                    }
                    errs() << "---------------------------------------------\n";
#endif
                }
                // 调用函数
                VisitFunction(*func, &argsMap, call->getFunction());
                // 处理返回值
                if (func->getReturnType()->isFunctionTy() || func->getReturnType()->isPointerTy())
                {
                    assert(funcMap[call->getFunction()]->lastCallReturnVal != nullptr);
                    valSet.insert(funcMap[call->getFunction()]->lastCallReturnVal->begin(), funcMap[call->getFunction()]->lastCallReturnVal->end());
                    delete funcMap[call->getFunction()]->lastCallReturnVal;
                    funcMap[call->getFunction()]->lastCallReturnVal = nullptr;
                }
            }
        }
        else
        {
            llvm_unreachable("Unhandled called type !!!");
        }
    }
    if (call->getType()->isFunctionTy() || call->getType()->isPointerTy())
    {
        UpdateAlias(call, &valSet);
    }
}

void PointerAnalysisVisitor::ProcessReturnInst(const ReturnInst *ret)
{
#ifdef DEBUG
    ret->dump();
#endif
    if (ret->getNumOperands() == 0)
        return;
    auto retValue = ret->getOperand(0);
    if (!(retValue->getType()->isFunctionTy() || retValue->getType()->isPointerTy()))
        return;
    auto callerFunc = funcMap[ret->getFunction()]->callerFunc;
    if (callerFunc == nullptr)
        return;
    auto callerFuncFrame = funcMap[callerFunc];
    assert(callerFuncFrame->lastCallReturnVal == nullptr);
    set<const Value *> *retValSet = new set<const Value *>();
    auto retValueAliasSet = GetAlias(retValue);
    retValSet->insert(retValueAliasSet.begin(), retValueAliasSet.end());
    callerFuncFrame->lastCallReturnVal = retValSet;
#ifdef DEBUG
    errs() << "Return Value : ------------------------------\n";
    for (auto value : *retValSet)
    {
        value->dump();
    }
    errs() << "---------------------------------------------\n";
#endif
}

void PointerAnalysisVisitor::ProcessPHINode(const PHINode *phi)
{
#ifdef DEBUG
    phi->dump();
#endif
    if (!(phi->getType()->isFunctionTy() || phi->getType()->isPointerTy()))
        return;

    set<const Value *> valSet;
    for (int i = 0; i < phi->getNumOperands(); ++i)
    {
        auto operandValueSet = GetAlias(phi->getOperand(i));
        valSet.insert(operandValueSet.begin(), operandValueSet.end());
    }
    UpdateAlias(phi, &valSet);
}

// store 将storeValue的aliasVakSet 或 其 本身（不是alias）存入target Value
void PointerAnalysisVisitor::ProcessStoreInst(const StoreInst *store)
{
#ifdef DEBUG
    store->dump();
#endif
    set<const Value *> valSet;
    auto storeValSet = GetAlias(store->getOperand(0));
    auto targetValSet = GetAlias(store->getOperand(1));
    valSet.insert(storeValSet.begin(), storeValSet.end());
    for (auto targetValue : targetValSet)
    {
        assert(isa<Instruction>(targetValue));
        auto inst = dyn_cast<Instruction>(targetValue);
        assert(CheckInDataFlow(inst));
        UpdateToDataFlow(inst, &valSet);
    }
}

// load的值是alias
void PointerAnalysisVisitor::ProcessLoadInst(const LoadInst *load)
{
#ifdef DEBUG
    load->dump();
#endif
    set<const Value *> aliasVarSet;
    auto srcValSet = GetAlias(load->getOperand(0));
    for (auto srcVal : srcValSet)
    {
        assert(isa<Instruction>(srcVal));
        auto inst = dyn_cast<Instruction>(srcVal);
        assert(CheckInDataFlow(inst));
        auto varSet = GetVerSetFromDataFlow(inst);
        aliasVarSet.insert(varSet->begin(), varSet->end());
    }
    UpdateAlias(load, &aliasVarSet);
}

// 类似于 先load 再store
void PointerAnalysisVisitor::ProcessCallMemcpy(const CallBase *call)
{
#ifdef DEBUG
    call->dump();
#endif
    set<const Value *> valSet;
    auto storePointerSet = GetAlias(call->getArgOperand(1));
    for (auto storeVal : storePointerSet)
    {
        assert(isa<Instruction>(storeVal));
        auto inst = dyn_cast<Instruction>(storeVal);
        auto storeValSet = GetVerSetFromDataFlow(inst);
        valSet.insert(storeValSet->begin(), storeValSet->end());
    }

    auto targetValSet = GetAlias(call->getArgOperand(0));
    for (auto targetValue : targetValSet)
    {
        assert(isa<Instruction>(targetValue));
        auto inst = dyn_cast<Instruction>(targetValue);
        assert(CheckInDataFlow(inst));
        UpdateToDataFlow(inst, &valSet);
    }
}

void PointerAnalysisVisitor::ProcessAllocaInst(const AllocaInst *alloc)
{
#ifdef DEBUG
    alloc->dump();
#endif
    set<const Value *> valSet;
    UpdateToDataFlow(alloc, &valSet);
}

void PointerAnalysisVisitor::ProcessBitCastInst(const BitCastInst *bitcast)
{
#ifdef DEBUG
    bitcast->dump();
#endif
    UpdateAlias(bitcast, bitcast->getOperand(0));
}

void PointerAnalysisVisitor::ProcessGetElementPtrInst(const GetElementPtrInst *getElementPtr)
{
#ifdef DEBUG
    getElementPtr->dump();
#endif
    UpdateAlias(getElementPtr, getElementPtr->getOperand(0));
}

void PointerAnalysisVisitor::merge(PointerAnalysisInfo *dest, const PointerAnalysisInfo &src)
{
    for (auto pair : src.varMap)
    {
        auto inst = pair.first;
        if (dest->varMap.find(inst) == dest->varMap.end())
        {
            dest->varMap.insert(std::make_pair(inst, new set<const Value *>()));
        }
        dest->varMap[inst]->insert(pair.second->begin(), pair.second->end());
    }
}

void PointerAnalysisVisitor::compDFVal(const Instruction *inst)
{
    if (isa<DbgInfoIntrinsic>(inst))
        return;

    if (auto call = dyn_cast<CallBase>(inst))
        ProcessCallBase(call);
    else if (auto phi = dyn_cast<PHINode>(inst))
        ProcessPHINode(phi);
    else if (auto alloc = dyn_cast<AllocaInst>(inst))
        ProcessAllocaInst(alloc);
    else if (auto bitcast = dyn_cast<BitCastInst>(inst))
        ProcessBitCastInst(bitcast);
    else if (auto getElementPtr = dyn_cast<GetElementPtrInst>(inst))
        ProcessGetElementPtrInst(getElementPtr);
    else if (auto store = dyn_cast<StoreInst>(inst))
        ProcessStoreInst(store);
    else if (auto load = dyn_cast<LoadInst>(inst))
        ProcessLoadInst(load);
    else if (auto ret = dyn_cast<ReturnInst>(inst))
        ProcessReturnInst(ret);
    // 处理各种类型的指令
}

void PointerAnalysisVisitor::compDFVal(const BasicBlock *block, bool isForward)
{
#ifdef DEBUG
    block->dump();
#endif
    funcMap[block->getParent()]->activeBlock = block;
    if (isForward == true)
    {
        for (auto ii = block->begin(), ie = block->end();
             ii != ie; ++ii)
        {
            auto inst = &*ii;
            compDFVal(inst);
        }
    }
    else
    {
        for (auto ii = block->rbegin(), ie = block->rend();
             ii != ie; ++ii)
        {
            auto inst = &*ii;
            compDFVal(inst);
        }
    }
}

void PointerAnalysisVisitor::VisitFunction(const Function &func, const map<const Argument *, set<const Value *> *> *argsMap, const Function *callerFunc)
{
    funcMap.insert(std::make_pair<const Function *, FunctionFrame *>(&func, new FunctionFrame(func, argsMap, callerFunc)));

    PointerAnalysisInfo initval;

    compForwardDataflow(&func, &funcMap[&func]->df, initval);

    funcMap.erase(&func);
}

bool PointerAnalysisVisitor::CheckInDataFlow(const Instruction *inst)
{
    auto func = inst->getFunction();
    auto funcFrame = funcMap[func];
    auto info = funcFrame->df.result[funcFrame->activeBlock].second;
    return info.varMap.find(inst) != info.varMap.end();
}

const set<const Value *> *PointerAnalysisVisitor::GetVerSetFromDataFlow(const Instruction *inst)
{
    assert(CheckInDataFlow(inst));
    auto func = inst->getFunction();
    auto funcFrame = funcMap[func];
    auto info = funcFrame->df.result[funcFrame->activeBlock].second;
    return info.varMap[inst];
}

void PointerAnalysisVisitor::UpdateToDataFlow(const Instruction *inst, const set<const Value *> *varSet)
{
    auto func = inst->getFunction();
    auto funcFrame = funcMap[func];
    auto &info = funcFrame->df.result[funcFrame->activeBlock].second;
    if (info.varMap.find(inst) == info.varMap.end())
    {
        info.varMap.insert(std::make_pair(inst, new set<const Value *>()));
    }
    info.varMap[inst]->clear();
    info.varMap[inst]->insert(varSet->begin(), varSet->end());

#ifdef DEBUG
    errs() << "UpdateToDataFlow : -------------------------------------\n";
    inst->dump();
    errs() << " -> \n";
    for (auto value : *varSet)
    {
        value->dump();
    }
    errs() << "--------------------------------------------------------\n";
#endif
}

// 判断是否是Alias
bool PointerAnalysisVisitor::IsAlias(const Value *val)
{
    if (auto constant = dyn_cast<Constant>(val))
        return false;
    else if (auto arg = dyn_cast<Argument>(val))
        return true;
    else if (auto inst = dyn_cast<Instruction>(val))
        if (funcMap[inst->getFunction()]->alias.find(inst) != funcMap[inst->getFunction()]->alias.end())
            return true;
        else
            return false;
}

// 返回值 要么是常数 要么一定在数据流中
set<const Value *> PointerAnalysisVisitor::GetAlias(const Value *val)
{
    // 如果是常数
    if (auto constant = dyn_cast<Constant>(val))
    {
        if (auto null = dyn_cast<ConstantPointerNull>(constant))
            return set<const Value *>{};
        return set<const Value *>{val};
    }
    // 如果是函数参数，函数参数一定在argsMap中，值可能是常数，也可能是别名
    else if (auto arg = dyn_cast<Argument>(val))
    {
        // 参数列表是nullptr
        if (funcMap[arg->getParent()]->argsMap == nullptr)
        {
            return set<const Value *>{};
        }
        else
        {
            assert(funcMap[arg->getParent()]->argsMap->find(arg) != funcMap[arg->getParent()]->argsMap->end());
            return *funcMap[arg->getParent()]->argsMap->at(arg);
        }
    }
    // 如果是普遍指令，可能是别名，也可能在数据流中
    else if (auto inst = dyn_cast<Instruction>(val))
    {
        // 别名
        if (funcMap[inst->getFunction()]->alias.find(inst) != funcMap[inst->getFunction()]->alias.end())
        {
            return *funcMap[inst->getFunction()]->alias[inst];
        }
        // 在数据流中
        else
        {
            return set<const Value *>{val};
        }
    }
}

void PointerAnalysisVisitor::UpdateAlias(const Instruction *alias, const Value *value)
{
    auto aliasVarSet = new set<const Value *>();
    set<const Value *> valAliasSet = GetAlias(value);
    aliasVarSet->insert(valAliasSet.begin(), valAliasSet.end());
    funcMap[alias->getFunction()]->alias.insert(std::make_pair(alias, aliasVarSet));
#ifdef DEBUG
    errs() << "Update Alias : ------------------------------\n";
    alias->dump();
    errs() << " -> \n";
    for (auto value : *aliasVarSet)
    {
        value->dump();
    }
    errs() << "---------------------------------------------\n";
#endif
}

void PointerAnalysisVisitor::UpdateAlias(const Instruction *alias, const set<const Value *> *valSet)
{
    auto aliasVarSet = new set<const Value *>();
    for (auto val : *valSet)
    {
        set<const Value *> valAliasSet = GetAlias(val);
        aliasVarSet->insert(valAliasSet.begin(), valAliasSet.end());
    }
    funcMap[alias->getFunction()]->alias.insert(std::make_pair(alias, aliasVarSet));
#ifdef DEBUG
    errs() << "Update Alias : ------------------------------\n";
    alias->dump();
    errs() << " -> \n";
    for (auto value : *aliasVarSet)
    {
        value->dump();
    }
    errs() << "---------------------------------------------\n";
#endif
}

void PointerAnalysisVisitor::updateOutput(int line, const Function *func)
{
    if (analysisResult.find(line) == analysisResult.end())
        analysisResult.insert(std::make_pair(line, new set<const Function *>()));
    analysisResult[line]->insert(func);
#ifdef DEBUG
    errs()
        << "Update Output : " << line << " -> " << func->getName() << "\n";
#endif
}

void PointerAnalysisVisitor::output() const
{
    for (auto p : analysisResult)
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

void PointerAnalysisVisitor::compForwardDataflow(const Function *fn,
                                                 Dataflow<PointerAnalysisInfo> *df,
                                                 const PointerAnalysisInfo &initval)
{
    set<const BasicBlock *> worklist;

    // Initialize the worklist with all exit blocks
    for (Function::const_iterator bi = fn->begin(); bi != fn->end(); ++bi)
    {
        const BasicBlock *bb = &*bi;
        df->result.insert(std::make_pair(bb, std::make_pair(initval, initval)));
        worklist.insert(bb);
    }

    // Iteratively compute the dataflow result
    while (!worklist.empty())
    {
        const BasicBlock *bb = *worklist.begin();
        worklist.erase(worklist.begin());

        // Merge all incoming value
        for (auto pi = pred_begin(bb), pe = pred_end(bb); pi != pe; pi++)
        {
            const BasicBlock *pred = *pi;
            merge(&df->result[bb].first, df->result[pred].second);
        }
        PointerAnalysisInfo prevBBExitVal = df->result[bb].second;
        df->result[bb].second = df->result[bb].first;
        compDFVal(bb, true);

#ifdef DEBUG
        df->result[bb].second.print();
#endif

        // If outgoing value changed, propagate it along the CFG
        if (prevBBExitVal == df->result[bb].second)
            continue;

        for (auto si = succ_begin(bb), se = succ_end(bb); si != se; si++)
        {
            worklist.insert(*si);
        }
    }
    return;
}
