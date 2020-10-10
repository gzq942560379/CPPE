#pragma once

#include "clang/AST/Decl.h"
#include "Object.h"

using namespace clang;

class StaticFrame
{
	std::map<Decl *, Object*> globalVars;

public:
	StaticFrame() : globalVars() {}
	void bindDecl(Decl *decl, Object* val)
	{
		globalVars[decl] = val;
	}
	Object* getDeclVal(Decl *decl)
	{
		assert(globalVars.find(decl) != globalVars.end());
		return globalVars.find(decl)->second;
	}
	bool hasDeclVal(Decl *decl)
	{
		return globalVars.find(decl) != globalVars.end();
	}
};