#pragma once
#include <stdio.h>

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/Decl.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendAction.h"
#include "clang/Tooling/Tooling.h"

using namespace clang;

#include "StackFrame.h"
#include "StaticFrame.h"
#include "Object.h"

class InterpreterVisitor;

class Environment
{
private:
	InterpreterVisitor *mVisitor;

	std::vector<StackFrame> mStack;
	StaticFrame mStatic;

	FunctionDecl *mFree; /// Declartions to the built-in functions
	FunctionDecl *mMalloc;
	FunctionDecl *mInput;
	FunctionDecl *mOutput;
	FunctionDecl *mEntry; // main functions

	// first search stack frame then search static frame
	Object *searchDeclVal(Decl *decl);
	void bindDeclToStack(Decl *decl, Object *val);
	void bindDeclToStatic(Decl *decl, Object *val);

	Object *getStmtVal(Stmt *stmt);
	void bindStmtToStack(Stmt *stmt, Object *val);

	void startNewFrame(FunctionDecl *entry, Expr **args);

public:
	/// Get the declartions to the built-in functions
	Environment();
	/// Initialize the Environment
	void initAndRun(TranslationUnitDecl *unit, InterpreterVisitor *visitor);
	FunctionDecl *getMainEntry();
	void binop(BinaryOperator *bop);
	void decl(DeclStmt *declstmt);
	void declref(DeclRefExpr *declref);
	void cast(CastExpr *castexpr);
	void call(CallExpr *callexpr);
	// added function ---------------------------------------------------
	void integerLiteral(IntegerLiteral *integer);
	void ifStmt(IfStmt *ifStmt);
	void returnStmt(ReturnStmt *returnStmt);
	void unaryOperator(UnaryOperator *unaryOperator);
	void whileStmt(WhileStmt *whileStmt);
	void forStmt(ForStmt *forStmt);
	void arraySubscriptExpr(ArraySubscriptExpr *arraySubscriptExpr);
	void unaryExprOrTypeTraitExpr(UnaryExprOrTypeTraitExpr *unaryExprOrTypeTraitExpr);
	void parenExpr(ParenExpr *parenExpr);
	// ------------------------------------------------------------------
};

//TODO 函数调用