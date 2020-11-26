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

class PointerAnalysisInfo
{
    bool operator==(const PointerAnalysisInfo &info) const
    {
        return false;
    }
};

inline raw_ostream &operator<<(raw_ostream &out, const PointerAnalysisInfo &info)
{
    return out;
}

class PointerAnalysisVisitor : public DataflowVisitor<struct PointerAnalysisInfo>
{
public:
    PointerAnalysisVisitor() {}
    void merge(PointerAnalysisInfo *dest, const PointerAnalysisInfo &src) override
    {
    }

    void compDFVal(Instruction *inst, PointerAnalysisInfo *dfval) override
    {
        if (isa<DbgInfoIntrinsic>(inst))
            return;
    }
};

class PointerAnalysis : public FunctionPass
{
public:
    static char ID;
    PointerAnalysis() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override
    {
        F.dump();
        // PointerAnalysisVisitor visitor;
        // DataflowResult<PointerAnalysisInfo>::Type result;
        // PointerAnalysisInfo initval;

        // compBackwardDataflow(&F, &visitor, &result, initval);
        // printDataflowResult<PointerAnalysisInfo>(errs(), result);
        return false;
    }
};
