#pragma once

#include "clang/AST/Decl.h"
#include "Object.h"

using namespace clang;

class StackFrame
{
	/// StackFrame maps Variable Declaration to Value
	/// Which are either integer or addresses (also represented using an Integer value)
	std::map<Decl *, Object *> mVars;
	std::map<Stmt *, Object *> mExprs;
	/// The current stmt
	Stmt *mPC;

public:
	StackFrame() : mVars(), mExprs(), mPC()
	{
	}
	void bindDecl(Decl *decl, Object *val)
	{
		mVars[decl] = val;
	}
	Object *getDeclVal(Decl *decl)
	{
		assert(mVars.find(decl) != mVars.end());
		return mVars.find(decl)->second;
	}
	bool hasDeclVal(Decl *decl)
	{
		return mVars.find(decl) != mVars.end();
	}

	void bindStmt(Stmt *stmt, Object* val)
	{
		if(hasStmtVal(stmt)){
			delete mExprs[stmt];
		}
		mExprs[stmt] = val;
	}
	Object* getStmtVal(Stmt *stmt)
	{
		assert(mExprs.find(stmt) != mExprs.end());
		return mExprs[stmt];
	}

	bool hasStmtVal(Stmt *stmt)
	{
		return mExprs.find(stmt) != mExprs.end();
	}
	void setPC(Stmt *stmt)
	{
		mPC = stmt;
	}
	Stmt *getPC()
	{
		return mPC;
	}
};
