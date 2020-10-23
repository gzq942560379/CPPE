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
public:
  const BasicBlock *bb;
  map<string, set<Function *>> varsMap;
  BasicBlockFrame(const BasicBlock *bb) : bb(bb){};
  void updateVar(const string varName, Function *func);
};

class FunctionFrame
{
public:
  const Function *func;
  vector<BasicBlockFrame *> bbStack;
  map<string, set<Function *>> *argsMap;
  FunctionFrame(const Function *func, map<string, set<Function *>> *argsMap) : func(func), argsMap(argsMap)
  {
    errs() << "construct FunctionFrame " << func->getName() << " ------------------------------------\n";
  };
  ~FunctionFrame()
  {
    errs() << "delete FunctionFrame " << func->getName() << " ------------------------------------\n";
    delete argsMap;
  };
  set<Function *> *searchVar(const string varName);
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
  map<int, set<Function *>> outputMap;

  void updateOutput(int line, Function *func);
  void output() const;

  // 搜索变量的所有可能值 局部变量 函数参数 全局变量
  set<Function *> *searchVer(Value *val, FunctionFrame &funcFrame) const;
  // 处理函数调用指令
  void ProcessCallbase(const CallBase *call, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 处理函数指针类型PHI指令
  void ProcessPHINode(const PHINode *phi, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 处理已经基本块
  void ProcessBasicBlock(BasicBlock &bb, BasicBlock *from, FunctionFrame &funcFrame, BasicBlockFrame &basicBlockframe);
  // 深度优先遍历基本块
  void DeepFirstTraverseCFG(BasicBlock &bb, BasicBlock *from);
  // 遍历函数调用图
  void TraverseFunc(Function &func, map<string, set<Function *>> *argsMap);

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

    // 从最后一个函数开始遍历CFG
    TraverseFunc(*startFunc, new map<string, set<Function *>>());
    // DeepFirstTraverseCFG(startFunc->getBasicBlockList().front());

    output();
    return false;
  }
};
