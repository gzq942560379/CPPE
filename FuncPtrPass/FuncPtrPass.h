#pragma once

#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>

#include <llvm/Support/raw_ostream.h>
#include <set>
#include <map>
#include <queue>
#include <stack>
#include <algorithm>

using namespace llvm;
using std::map;
using std::pair;
using std::queue;
using std::set;
using std::stack;
using std::string;
using std::tuple;
using std::vector;

// #define DEBUG

class BasicBlockFrame
{
#ifdef DEBUG
  static int counter;
#endif

public:
  const BasicBlock *bb;
  map<const Value *, set<const Function *> *> varsMap;
  map<const CmpInst *, bool> condVerMap;
  BasicBlockFrame(const BasicBlock *bb) : bb(bb)
  {
#ifdef DEBUG
    counter++;
    errs() << "construct BasicBlockFrame " << counter << " ------------------------------------\n";
#endif
  };
  ~BasicBlockFrame()
  {
#ifdef DEBUG
    errs() << "delete BasicBlockFrame " << counter << " ------------------------------------\n";
    counter--;
#endif
    for (auto p : varsMap)
      delete p.second;
  }
  void updateVarWithFunctionSet(const Value *val, set<const Function *> *funcSet);
  void updateConditionValWithBool(const CmpInst *val, bool funcSet);
};

class FunctionFrame
{
public:
  vector<BasicBlockFrame *> bbStack;
  const Function *func;
  map<const Argument *, set<const Function *> *> *argsMap;
  FunctionFrame *callerFrame;
  set<const Function *> *lastCallReturnVal = nullptr;
  map<const BasicBlock *, int> colors;
  FunctionFrame(const Function *func, map<const Argument *, set<const Function *> *> *argsMap, FunctionFrame *callerFrame) : func(func), argsMap(argsMap), callerFrame(callerFrame)
  {
#ifdef DEBUG
    errs() << "construct FunctionFrame " << func->getName() << " ------------------------------------\n";
#endif
    // 初始化颜色为-1
    for (const BasicBlock &bb : *func)
      colors[&bb] = -1;
  };
  ~FunctionFrame()
  {
#ifdef DEBUG
    errs() << "delete FunctionFrame " << func->getName() << " ---------------------------------------\n";
#endif
    for (auto p : *argsMap)
      delete p.second;
    delete argsMap;
  };
  void updateArgWithFunctionSet(const Argument *, set<const Function *> *funcSet);
  void returnVal(set<const Function *> *funcSet)
  {
    assert(callerFrame != nullptr && "callerFrame should not be nullptr !!!");
    callerFrame->lastCallReturnVal = funcSet;
  }
};

///!TODO TO BE COMPLETED BY YOU FOR ASSIGNMENT 2
///Updated 11/10/2017 by fargo: make all functions
///processed by mem2reg before this pass.
struct FuncPtrPass : public ModulePass
{
  static char ID; // Pass identification, replacement for typeid
  FuncPtrPass() : ModulePass(ID) {}

  vector<FunctionFrame *> funcStack;
  map<int, set<const Function *> *> outputMap;

  static bool isFunctionPointer(const Value *value);

  void updateOutput(int line, const Function *func);
  void output() const;

  // 搜索变量的所有可能值 局部变量 函数参数 全局变量 创建新对象
  set<const Function *> *getFunctionSetFromValue(const Value *value, FunctionFrame &funcFrame);
  // 搜索永真永假条件变量
  bool hasBoolValueforCmpInst(const CmpInst *cmpInst, FunctionFrame &funcFrame);
  // 获取永真永假条件变量
  bool getBoolValueFromCmpInst(const CmpInst *cmpInst, FunctionFrame &funcFrame);
  // 考虑函数调用 函数指针参数传递 创建新对象
  map<const Argument *, set<const Function *> *> *initArgsMap(const CallBase *call, const Function *func, FunctionFrame &funcFrame);
  // 处理返回函数指针的ReturnInst
  void ProcessReturnInst(const ReturnInst *retInst, FunctionFrame &funcFrame);
  void ProcessICmpInst(const ICmpInst *icmpInst, BasicBlockFrame &basicBlockframe);
  // 处理所有函数调用
  void ProcessCallbase(const CallBase *call, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 处理函数指针类型PHI指令
  void ProcessPHINode(const PHINode *phi, const BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 处理Terminator,深度优先遍历BasicBlock 判断永真永假条件
  void processTerminator(const Instruction *inst, const BasicBlock &bb);
  // 处理基本块
  void ProcessBasicBlock(const BasicBlock &bb, const BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 深度优先遍历基本块
  void DeepFirstTraverseCFG(const BasicBlock &bb, const BasicBlock *from);
  // 遍历函数调用图
  void TraverseFunc(const Function &func, map<const Argument *, set<const Function *> *> *argsMap, FunctionFrame *callerFrame);

  bool runOnModule(Module &M) override
  {
#ifdef DEBUG
    errs() << "Module start ------------------------------------------------------------------\n";
    M.dump();
    errs() << "Module end --------------------------------------------------------------------\n";
#endif

    // 从每个函数开始遍历CFG
    for (Function &f : M)
      if (!f.getName().startswith("llvm.dbg.") && !f.isDeclaration())
        TraverseFunc(f, new map<const Argument *, set<const Function *> *>(), nullptr);

    output();
    return false;
  }
};
