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

#define DEBUG

class BasicBlockFrame
{
#ifdef DEBUG
  static int counter;
#endif

public:
  const BasicBlock *bb;
  map<const Value *, set<Function *> *> varsMap;
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
  void updateVarWithFunctionSet(const Value *val, set<Function *> *funcSet);
};

class FunctionFrame
{
public:
  vector<BasicBlockFrame *> bbStack;
  const Function *func;
  map<const Argument *, set<Function *> *> *argsMap;
  FunctionFrame *callerFrame;
  set<Function *> *lastCallReturnVal = nullptr;
  map<const BasicBlock *, int> colors;
  FunctionFrame(const Function *func, map<const Argument *, set<Function *> *> *argsMap, FunctionFrame *callerFrame) : func(func), argsMap(argsMap), callerFrame(callerFrame)
  {
    errs() << "construct FunctionFrame " << func->getName() << " ------------------------------------\n";
    // 初始化颜色为-1
    for (const BasicBlock &bb : *func)
      colors[&bb] = -1;
  };
  ~FunctionFrame()
  {
    errs() << "delete FunctionFrame " << func->getName() << " ---------------------------------------\n";
    for (auto p : *argsMap)
      delete p.second;
    delete argsMap;
  };
  void updateArgWithFunctionSet(const Argument *, set<Function *> *funcSet);
  void returnVal(set<Function *> *funcSet)
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

  map<string, Function *> funcMap;
  Function *startFunc;

  vector<FunctionFrame *> funcStack;
  map<int, set<Function *> *> outputMap;

  static bool isFunctionPointer(const Value *value);

  void updateOutput(int line, Function *func);
  void output() const;

  // 搜索变量的所有可能值 局部变量 函数参数 全局变量 创建新对象
  set<Function *> *getFunctionSetFromValue(Value *value, FunctionFrame &funcFrame);
  // 考虑函数调用 函数指针参数传递 创建新对象
  map<const Argument *, set<Function *> *> *initArgsMap(const CallBase *call, const Function *func, FunctionFrame &funcFrame);
  // 处理返回函数指针的ReturnInst
  void ProcessReturnInst(const ReturnInst *retInst, FunctionFrame &funcFrame);
  // 处理所有函数调用
  void ProcessCallbase(const CallBase *call, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 处理函数指针类型PHI指令
  void ProcessPHINode(const PHINode *phi, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 处理基本块
  void ProcessBasicBlock(BasicBlock &bb, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 深度优先遍历基本块
  void DeepFirstTraverseCFG(BasicBlock &bb, BasicBlock *from);
  // 遍历函数调用图
  void TraverseFunc(Function &func, map<const Argument *, set<Function *> *> *argsMap, FunctionFrame *callerFrame);

  bool runOnModule(Module &M) override
  {
#ifdef DEBUG
    errs() << "Module start ------------------------------------------------------------------\n";
    M.dump();
    errs() << "Module end --------------------------------------------------------------------\n";
#endif

    // init funcMap
    for (Function &f : M)
      if (!f.getName().startswith("llvm.dbg."))
        funcMap[f.getName()] = &f;
    // find last function
    for (auto fi = M.rbegin(); fi != M.rend(); ++fi)
    {
      if (!fi->getName().startswith("llvm.dbg."))
      {
        startFunc = &*fi;
        break;
      }
    }
    // 从每个函数开始遍历CFG
    for (Function &f : M)
      if (!f.getName().startswith("llvm.dbg.") && !f.isDeclaration())
        TraverseFunc(f, new map<const Argument *, set<Function *> *>(), nullptr);

    output();
    return false;
  }
};
