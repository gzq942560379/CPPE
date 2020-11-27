#pragma once

//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/IntrinsicInst.h>

#include "Dataflow.h"

using namespace llvm;
using std::map;
using std::set;

class PointerAnalysisInfo
{
public:
    map<const Instruction *, set<const Value *> *> varMap;

    bool operator==(const PointerAnalysisInfo &info) const
    {
        return varMap == info.varMap;
    }

    void print()
    {
        errs() << "PointerAnalysisInfo : -------------------------------------\n";
        for (auto pair : varMap)
        {
            pair.first->dump();
            errs() << " -> \n";
            for (auto value : *pair.second)
            {
                value->dump();
            }
        }
        errs() << "-----------------------------------------------------------\n";
    }
};

class FunctionFrame
{
public:
    const Function &func;
    const Function *callerFunc = nullptr;
    map<const Value *, set<const Value *> *> alias;
    Dataflow<PointerAnalysisInfo> df;
    const BasicBlock *activeBlock;
    const map<const Argument *, set<const Value *> *> *argsMap = nullptr;
    set<const Value *> *lastCallReturnVal = nullptr;
    FunctionFrame(const Function &func, const map<const Argument *, set<const Value *> *> *argsMap, const Function *callerFunc) : func(func), argsMap(argsMap), callerFunc(callerFunc), lastCallReturnVal(nullptr){};
};

class PointerAnalysisVisitor : public DataflowVisitor<struct PointerAnalysisInfo>
{
public:
    map<int, set<const Function *> *> analysisResult;
    map<const Function *, FunctionFrame *> funcMap;

    PointerAnalysisVisitor()
    {
    }
    void output() const;
    void updateOutput(int line, const Function *func);

    void ProcessPHINode(const PHINode *phi);
    void ProcessCallBase(const CallBase *call);
    void ProcessAllocaInst(const AllocaInst *alloc);
    void ProcessBitCastInst(const BitCastInst *bitcast);
    void ProcessGetElementPtrInst(const GetElementPtrInst *getElementPtr);
    void ProcessStoreInst(const StoreInst *store);
    void ProcessLoadInst(const LoadInst *load);
    void ProcessReturnInst(const ReturnInst *ret);
    void ProcessCallMemcpy(const CallBase *call);

    // 合并两个分析结果
    void merge(PointerAnalysisInfo *dest, const PointerAnalysisInfo &src) override;
    // 处理BasicBlock中的指令，调用对应指令类型的Process函数
    void compDFVal(const Instruction *inst) override;
    // 处理BasicBlock中的指令
    void compDFVal(const BasicBlock *block, bool isForward) override;
    // 遍历调用图
    void VisitFunction(const Function &func, const map<const Argument *, set<const Value *> *> *argsMap, const Function *callerFunc);

    // 判断是否是别名
    bool IsAlias(const Value *val);
    // 解析别名
    set<const Value *> GetAlias(const Value *val);
    // 更新别名
    void UpdateAlias(const Instruction *alias, const Value *value);
    void UpdateAlias(const Instruction *alias, const set<const Value *> *valSet);
    // 检查Value是否在数据流中
    bool CheckInDataFlow(const Instruction *inst);
    // 从数据流中获取VarSet
    const set<const Value *> *GetVerSetFromDataFlow(const Instruction *inst);
    // 更新DataFlow
    void UpdateToDataFlow(const Instruction *inst, const set<const Value *> *varSet);

    void compForwardDataflow(const Function *fn, Dataflow<PointerAnalysisInfo> *df, const PointerAnalysisInfo &initval);
};


