#pragma once

/************************************************************************
 *
 * @file Dataflow.h
 *
 * General dataflow framework
 *
 ***********************************************************************/

#include <llvm/Support/raw_ostream.h>
#include <map>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Function.h>
#include <set>

using namespace llvm;
using std::map;
using std::set;

// #define DEBUG

///
/// Dummy class to provide a typedef for the detailed result set
/// For each basicblock, we compute its input dataflow val and its output dataflow val
///
template <class T>
struct Dataflow
{
    std::map<const BasicBlock *, std::pair<T, T>> result;
};

template <class T>
inline raw_ostream &operator<<(raw_ostream &out, const Dataflow<T> &df)
{
    return out;
}

///Base dataflow visitor class, defines the dataflow function

template <class T>
class DataflowVisitor
{
public:
    virtual ~DataflowVisitor() {}

    /// Dataflow Function invoked for each basic block
    ///
    /// @block the Basic Block
    /// @dfVal the input dataflow value
    /// @isForward true to compute dfVal forward, otherwise backward
    virtual void compDFVal(const BasicBlock *block, bool isForward)
    {
#ifdef DEBUG
        block->dump();
#endif
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

    ///
    /// Dataflow Function invoked for each instruction
    ///
    /// @inst the Instruction
    /// @dfVal the input dataflow value
    /// @return true if dfVal changed
    virtual void compDFVal(const Instruction *inst) = 0;

    ///
    /// Merge of two dfVals, dest will be ther merged result
    /// @return true if dest changed
    ///
    virtual void merge(T *dest, const T &src) = 0;

};
