//==--- tools/clang-check/ClangInterpreter.cpp - Clang Interpreter tool --------------===//
//===----------------------------------------------------------------------===//

#include "clang/Tooling/Tooling.h"
#include "ASTInterpreter.h"
#include "util.h"

using namespace clang;

int main(int argc, char **argv)
{
   if (argc > 1)
   {

      std::string code = ReadFileIntoString(argv[1]);
      clang::tooling::runToolOnCode(std::unique_ptr<clang::FrontendAction>(new InterpreterClassAction), code);
      //  clang::tooling::runToolOnCode(std::unique_ptr<clang::FrontendAction>(new InterpreterClassAction), argv[1]);
   }
}
