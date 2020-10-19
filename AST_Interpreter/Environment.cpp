#include "Environment.h"

#include "ASTInterpreter.h"

Environment::Environment() : mStack(), mFree(NULL), mMalloc(NULL), mInput(NULL), mOutput(NULL), mEntry(NULL)
{
}
FunctionDecl *Environment::getMainEntry()
{
    return mEntry;
}
bool Environment::hasReturn()
{
    return mStack.back().hasReturn();
}
Object *Environment::searchDeclVal(Decl *decl)
{
    if (this->mStack.back().hasDeclVal(decl))
    {
        return this->mStack.back().getDeclVal(decl);
    }
    else if (this->mStatic.hasDeclVal(decl))
    {
        return this->mStatic.getDeclVal(decl);
    }
    else
    {
        assert(0);
    }
}
void Environment::bindDeclToStack(Decl *decl, Object *val)
{
    mStack.back().bindDecl(decl, val);
}

void Environment::bindDeclToStatic(Decl *decl, Object *val)
{
    mStatic.bindDecl(decl, val);
}
Object *Environment::getStmtVal(Stmt *stmt)
{
    if (this->hasStmtVal(stmt))
    {
        return this->mStack.back().getStmtVal(stmt);
    }
    else
    {
        assert(0);
    }
}
bool Environment::hasStmtVal(Stmt *stmt)
{
    return mStack.back().hasStmtVal(stmt);
}
void Environment::bindStmtToStack(Stmt *stmt, Object *val)
{
    mStack.back().bindStmt(stmt, val);
}

void Environment::startNewFrame(FunctionDecl *entry, Expr **args = nullptr)
{
    mStack.push_back(StackFrame());

    for (FunctionDecl::param_iterator pi = entry->param_begin(); pi != entry->param_end(); ++pi)
    {
        if (ParmVarDecl *paraVarDecl = dyn_cast<ParmVarDecl>(*pi))
        {
            const Type *type = paraVarDecl->getType().getTypePtr();

            if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
            {
                if (builtinType->getKind() == BuiltinType::Kind::Int)
                {
                    int val = mStack[mStack.size() - 2].getStmtVal(args[pi - entry->param_begin()])->getInt32();
                    bindDeclToStack(paraVarDecl, new Object(val));
                }
                else
                    assert(0);
            }
            else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
            {
                void *pointer = mStack[mStack.size() - 2].getStmtVal(args[pi - entry->param_begin()])->getPointer();
                bindDeclToStack(paraVarDecl, new Object(pointer));
            }
            else
            {
#ifdef DEBUG
                type->dump();
#endif
                assert(0);
            }
        }
        else
            assert(0);
    }
#ifdef DEBUG
    entry->dumpColor();
    llvm::errs() << "\n";
#endif
    mVisitor->Visit(entry->getBody());
}

void Environment::initAndRun(TranslationUnitDecl *unit, InterpreterVisitor *visitor)
{
    mVisitor = visitor;
    for (TranslationUnitDecl::decl_iterator i = unit->decls_begin(), e = unit->decls_end(); i != e; ++i)
    {
        if (FunctionDecl *fdecl = dyn_cast<FunctionDecl>(*i))
        {
            if (fdecl->getName().equals("FREE"))
                mFree = fdecl;
            else if (fdecl->getName().equals("MALLOC"))
                mMalloc = fdecl;
            else if (fdecl->getName().equals("GET"))
                mInput = fdecl;
            else if (fdecl->getName().equals("PRINT"))
                mOutput = fdecl;
            else if (fdecl->getName().equals("main"))
                mEntry = fdecl;
            else
            {
                // custom function
                // do nothing
            }
        }
        else if (VarDecl *varDecl = dyn_cast<VarDecl>(*i))
        {
            // global value
            const Type *type = varDecl->getType().getTypePtr();
            if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
            {
                if (builtinType->getKind() == BuiltinType::Kind::Int)
                {
                    if (varDecl->hasInit())
                    {
                        if (varDecl->evaluateValue()->hasValue() && varDecl->evaluateValue()->isInt())
                        {
                            int val = varDecl->evaluateValue()->getInt().getSExtValue();
                            bindDeclToStatic(varDecl, new Object(val));
                        }
                        else
                            assert(0);
                    }
                    else
                    {
                        bindDeclToStatic(varDecl, new Object(0));
                    }
                }
                else
                    assert(0);
            }
            else
                assert(0);
        }
        else if (TypedefDecl *typedefDecl = dyn_cast<TypedefDecl>(*i))
        {
            // ignore typedef
        }
        else
            assert(0);
    }

    startNewFrame(mEntry);
}

/// !TODO Support comparison operation
void Environment::binop(BinaryOperator *bop)
{

    Expr *left = bop->getLHS();
    Expr *right = bop->getRHS();
    const Type *type = bop->getType().getTypePtr();
    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            if (bop->getOpcode() == BinaryOperator::Opcode::BO_Assign)
            {
                int32_t val = getStmtVal(right)->getInt32();
                *(int32_t *)getStmtVal(left)->getPointer() = val;
                bindStmtToStack(bop, new Object(val));
#ifdef DEBUG
                llvm::errs() << "(int) asssign addr : " << getStmtVal(left)->getPointer() << " : " << val << "\n";
#endif
            }
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Add)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() + getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Sub)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() - getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Mul)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() * getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Div)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() / getStmtVal(right)->getInt32()));
            else
                assert(0);
        }
        else if (builtinType->getKind() == BuiltinType::Kind::ULong)
        {
            if (bop->getOpcode() == BinaryOperator::Opcode::BO_Add)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getUInt64() + getStmtVal(right)->getUInt64()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Sub)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getUInt64() - getStmtVal(right)->getUInt64()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Mul)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getUInt64() * getStmtVal(right)->getUInt64()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Div)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getUInt64() / getStmtVal(right)->getUInt64()));
            else
                assert(0);
        }
        else if (builtinType->getKind() == BuiltinType::Kind::Bool)
        {
            if (bop->getOpcode() == BinaryOperator::Opcode::BO_EQ)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() == getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_NE)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() != getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_LT)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() < getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_GT)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() > getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_LE)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() <= getStmtVal(right)->getInt32()));
            else if (bop->getOpcode() == BinaryOperator::Opcode::BO_GE)
                bindStmtToStack(bop, new Object(getStmtVal(left)->getInt32() >= getStmtVal(right)->getInt32()));

            else
                assert(0);
        }
        else
            assert(0);
    }
    else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
    {

        if (bop->getOpcode() == BinaryOperator::Opcode::BO_Assign)
        {
            void *val = (void *)getStmtVal(right)->getPointer();
            *(void **)(getStmtVal(left)->getPointer()) = val;
            bindStmtToStack(bop, new Object(val));
#ifdef DEBUG
            llvm::errs() << "point asssign addr : " << getStmtVal(left)->getPointer() << " : " << val << "\n";
#endif
        }
        else if (bop->getOpcode() == BinaryOperator::Opcode::BO_Add)
        {
            const Type *pointeeType = pointerType->getPointeeType().getTypePtr();
            if (const BuiltinType *builtinPointeeType = dyn_cast<BuiltinType>(pointeeType))
            {
                if (builtinPointeeType->getKind() == BuiltinType::Kind::Int)
                {
                    bindStmtToStack(bop, new Object((int *)getStmtVal(left)->getPointer() + getStmtVal(right)->getInt32()));
                }
                else
                {
                    assert(0);
                }
            }
            else if (const PointerType *pointerPointeeType = dyn_cast<PointerType>(pointeeType))
            {
            }
            else
            {
                assert(0);
            }
        }
        else
        {
            assert(0);
        }
    }
    else
        assert(0);
}

void Environment::decl(DeclStmt *declstmt)
{
    for (DeclStmt::decl_iterator it = declstmt->decl_begin(), ie = declstmt->decl_end();
         it != ie; ++it)
    {
        Decl *decl = *it;
        if (VarDecl *vardecl = dyn_cast<VarDecl>(decl))
        {
            const Type *type = vardecl->getType().getTypePtr();

            if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
            {
                if (builtinType->getKind() == BuiltinType::Kind::Int)
                {
                    if (vardecl->hasInit())
                    {
                        mVisitor->Visit(vardecl->getInit());
                        bindDeclToStack(vardecl, new Object(getStmtVal(vardecl->getInit())->getInt32()));
                    }
                    else
                    {
                        bindDeclToStack(vardecl, new Object(0));
                    }
#ifdef DEBUG
                    Object *debugObj = searchDeclVal(vardecl);
                    llvm::errs() << "int Decl Addr : " << debugObj->getAddress() << " : " << debugObj->getInt32() << "\n";
#endif
                }
                else
                    assert(0);
            }
            else if (const ConstantArrayType *constArrayType = dyn_cast<ConstantArrayType>(type))
            {
                size_t size = constArrayType->getSize().getZExtValue();
                const Type *type = constArrayType->getElementType().getTypePtr();
                if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
                {
                    if (builtinType->getKind() == BuiltinType::Kind::Int)
                    {
                        Object *arrObj = new Object(true, size, Object::INT32);
                        if (vardecl->hasInit())
                        {
                            //! TODO array init
                            assert(0);
                        }
                        bindDeclToStack(decl, arrObj);
                    }
                    else
                        assert(0);
                }
                else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
                {
                    Object *pointerArrObj = new Object(true, size, Object::POINTER);
                    if (vardecl->hasInit())
                    {
                        //! TODO array init
                        assert(0);
                    }
                    bindDeclToStack(decl, pointerArrObj);
                }
                else
                    assert(0);
            }
            else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
            {
                Object *pointerObj = new Object(nullptr);
                if (vardecl->hasInit())
                {
                    //! TODO pointer init
                    assert(0);
                }
                bindDeclToStack(decl, pointerObj);
#ifdef DEBUG
                Object *debugObj = searchDeclVal(decl);
                llvm::errs() << "point Decl Addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
            }
            else
                assert(0);
        }
        else
            assert(0);
    }
}

void Environment::declref(DeclRefExpr *declref)
{
    mStack.back().setPC(declref);
    const Type *type = declref->getType().getTypePtr();

    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            bindStmtToStack(declref, new Object(searchDeclVal(declref->getFoundDecl())->getAddress()));
#ifdef DEBUG
            Object *debugObj = getStmtVal(declref);
            llvm::errs() << "int Declref Addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
        }
        else
            assert(0);
    }
    else if (declref->getType()->isConstantArrayType())
    {
        bindStmtToStack(declref, new Object(searchDeclVal(declref->getFoundDecl())->getAddress()));
    }
    else if (declref->getType()->isPointerType())
    {
        bindStmtToStack(declref, new Object(searchDeclVal(declref->getFoundDecl())->getAddress()));
#ifdef DEBUG
        Object *debugObj = getStmtVal(declref);
        llvm::errs() << "point Declref Addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
    }
    else if (declref->getType()->isFunctionType())
    {
        // function declref
        // do nothing
    }
    else
        assert(0);
}

void Environment::cast(CastExpr *castexpr)
{
    mStack.back().setPC(castexpr);
    const Type *type = castexpr->getType().getTypePtr();
    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            if (castexpr->getCastKind() == CastKind::CK_LValueToRValue)
            {
                bindStmtToStack(castexpr, new Object(*(int32_t *)getStmtVal(castexpr->getSubExpr())->getPointer()));
#ifdef DEBUG
                Object *debugObj = getStmtVal(castexpr);
                llvm::errs() << "int l2r cast Addr : " << debugObj->getAddress() << " : " << debugObj->getInt32() << "\n";
#endif
            }
            else if (castexpr->getCastKind() == CastKind::CK_IntegralCast)
            {
                Object *obj = getStmtVal(castexpr->getSubExpr());
                if (obj->isUInt64())
                {
                    bindStmtToStack(castexpr, new Object(int(obj->getUInt64())));
                }
                else
                    assert(0);
            }
            else
                assert(0);
        }
        else if (builtinType->getKind() == BuiltinType::Kind::ULong)
        {
            if (castexpr->getCastKind() == CastKind::CK_IntegralCast)
            {
                Object *obj = getStmtVal(castexpr->getSubExpr());
                if (obj->isInt32())
                {
                    bindStmtToStack(castexpr, new Object(uint64_t(obj->getInt32())));
                }
                else
                    assert(0);
            }
            else
                assert(0);
        }
        else
            assert(0);
    }
    else if (castexpr->getType()->isPointerType() && !castexpr->getSubExpr()->getType()->isFunctionType())
    {
        if (castexpr->getCastKind() == CastKind::CK_LValueToRValue)
        {
            bindStmtToStack(castexpr, new Object(*(void **)getStmtVal(castexpr->getSubExpr())->getPointer()));
#ifdef DEBUG
            Object *debugObj = getStmtVal(castexpr);
            llvm::errs() << "point l2r cast Addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
        }
        else
        {
            bindStmtToStack(castexpr, new Object(getStmtVal(castexpr->getSubExpr())->getPointer()));
#ifdef DEBUG
            Object *debugObj = getStmtVal(castexpr);
            llvm::errs() << "point cast Addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
        }
    }
    else if (castexpr->getType()->isFunctionPointerType())
    {
        // function cast
        // do nothing
    }
    else
        assert(0);
}

/// !TODO Support Function Call
void Environment::call(CallExpr *callexpr)
{
    mStack.back().setPC(callexpr);

    FunctionDecl *callee = callexpr->getDirectCallee();
    if (callee == mInput)
    {
        int32_t val;
        llvm::errs() << "Please Input an Integer Value : ";
        scanf("%d", &val);
        bindStmtToStack(callexpr, new Object(val));
    }
    else if (callee == mOutput)
    {
        Expr *decl = callexpr->getArg(0);
        int32_t val = getStmtVal(decl)->getInt32();
        llvm::errs() << val;
    }
    else if (callee == mMalloc)
    {
        int32_t size = getStmtVal(callexpr->getArg(0))->getInt32();
        void *pointerVal = malloc(sizeof(size));
        bindStmtToStack(callexpr, new Object(pointerVal));
#ifdef DEBUG
        llvm::errs() << "call malloc : " << pointerVal << "\n";
#endif
    }
    else if (callee == mFree)
    {
        void *pointerVal = getStmtVal(callexpr->getArg(0))->getPointer();
        free(pointerVal);
    }
    else
    {
        // create and visit function
        startNewFrame(callee, callexpr->getArgs());
        Object *retVal = mStack.back().getReturn();
        // delete frame
        mStack.pop_back();
        bindStmtToStack(callexpr, retVal);
#ifdef DEBUG
        const Type *type = callexpr->getType().getTypePtr();
        if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
        {
            if (builtinType->getKind() == BuiltinType::Kind::Int)
            {
                Object *debugObj = getStmtVal(callexpr);
                llvm::errs() << "call return int : " << debugObj->getInt32() << "\n";
            }
            else if (builtinType->getKind() == BuiltinType::Kind::Void)
            {
                // do nothing
            }
            else
                assert(0);
        }
        else
        {
            assert(0);
        }
#endif
    }
}

void Environment::integerLiteral(IntegerLiteral *integer)
{
    const Type *type = integer->getType().getTypePtr();
    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            mStack.back().setPC(integer);
            int32_t val = integer->getValue().getSExtValue();
            bindStmtToStack(integer, new Object(val));
        }
        else
            assert(0);
    }
    else
        assert(0);
}

void Environment::ifStmt(IfStmt *ifStmt)
{
    mStack.back().setPC(ifStmt);
    mVisitor->Visit(ifStmt->getCond());

    bool condResult = getStmtVal(ifStmt->getCond())->getBool();

    if (condResult)
        mVisitor->Visit(ifStmt->getThen());
    else if (ifStmt->getElse() != NULL)
        mVisitor->Visit(ifStmt->getElse());
}

void Environment::returnStmt(ReturnStmt *returnStmt)
{
    mStack.back().setPC(returnStmt);
    Object *returnValue = nullptr;

    const Type *type = returnStmt->getRetValue()->getType().getTypePtr();
    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            // get return value
            returnValue = new Object(getStmtVal(returnStmt->getRetValue())->getInt32());
        }
        else
            assert(0);
    }
    else
        assert(0);
    // Void return
    if (returnValue == nullptr)
    {
        returnValue = new Object();
    }
    mStack.back().setReturn(returnValue);
}

void Environment::unaryOperator(UnaryOperator *unaryOperator)
{
    mStack.back().setPC(unaryOperator);

    const Type *type = unaryOperator->getType().getTypePtr();

    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            if (unaryOperator->getOpcode() == UnaryOperator::Opcode::UO_Minus)
                bindStmtToStack(unaryOperator, new Object(0 - getStmtVal(unaryOperator->getSubExpr())->getInt32()));
            else if (unaryOperator->getOpcode() == UnaryOperator::Opcode::UO_Deref)
            {
                bindStmtToStack(unaryOperator, new Object((int32_t *)(getStmtVal(unaryOperator->getSubExpr())->getPointer())));
#ifdef DEBUG
                Object *debugObj = getStmtVal(unaryOperator);
                llvm::errs() << "int Deref addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
            }
            else
                assert(0);
        }
        else
            assert(0);
    }
    else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
    {
        if (unaryOperator->getOpcode() == UnaryOperator::Opcode::UO_Deref)
        {

            bindStmtToStack(unaryOperator, new Object((void *)(getStmtVal(unaryOperator->getSubExpr())->getPointer())));
#ifdef DEBUG
            Object *debugObj = getStmtVal(unaryOperator);
            llvm::errs() << "point Deref addr : " << debugObj->getAddress() << " : " << debugObj->getPointer() << "\n";
#endif
        }
        else
            assert(0);
    }
    else
        assert(0);
}

void Environment::whileStmt(WhileStmt *whileStmt)
{
    mStack.back().setPC(whileStmt);

    mVisitor->Visit(whileStmt->getCond());
    bool condResult = getStmtVal(whileStmt->getCond())->getBool();
    while (condResult)
    {
        mVisitor->Visit(whileStmt->getBody());

        mVisitor->Visit(whileStmt->getCond());
        condResult = getStmtVal(whileStmt->getCond())->getBool();
    }
}

void Environment::forStmt(ForStmt *forStmt)
{
    mStack.back().setPC(forStmt);
    if (forStmt->getInit() != NULL)
        mVisitor->Visit(forStmt->getInit());
    if (forStmt->getCond() != NULL)
        mVisitor->Visit(forStmt->getCond());
    bool condResult = forStmt->getCond() == NULL ? true : getStmtVal(forStmt->getCond())->getBool();
    while (condResult)
    {
        mVisitor->Visit(forStmt->getBody());
        if (forStmt->getInc() != NULL)
            mVisitor->Visit(forStmt->getInc());
        if (forStmt->getCond() != NULL)
            mVisitor->Visit(forStmt->getCond());
        condResult = forStmt->getCond() == NULL ? true : getStmtVal(forStmt->getCond())->getBool();
        ;
    }
}

void Environment::arraySubscriptExpr(ArraySubscriptExpr *arraySubscriptExpr)
{
    mStack.back().setPC(arraySubscriptExpr);

    void *pointer = getStmtVal(arraySubscriptExpr->getLHS())->getPointer();
    int64_t offset = getStmtVal(arraySubscriptExpr->getRHS())->getInt32();

    const Type *type = arraySubscriptExpr->getType().getTypePtr();
    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            bindStmtToStack(arraySubscriptExpr, new Object(pointer, Object::ELE_TYPE::INT32, offset));
        }
        else
            assert(0);
    }
    else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
    {
        bindStmtToStack(arraySubscriptExpr, new Object(pointer, Object::ELE_TYPE::POINTER, offset));
    }
    else
    {
        assert(0);
    }
}

void Environment::unaryExprOrTypeTraitExpr(UnaryExprOrTypeTraitExpr *unaryExprOrTypeTraitExpr)
{
    mStack.back().setPC(unaryExprOrTypeTraitExpr);

    if (unaryExprOrTypeTraitExpr->getKind() == UnaryExprOrTypeTrait::UETT_SizeOf)
    {
        const Type *type = unaryExprOrTypeTraitExpr->getArgumentType().getTypePtr();
        if (type->isBuiltinType())
        {
            const BuiltinType *builtinType = dyn_cast<BuiltinType>(type);
            if (builtinType->getKind() == BuiltinType::Int)
                bindStmtToStack(unaryExprOrTypeTraitExpr, new Object(sizeof(int)));
            else
                assert(0);
        }
        else if (type->isPointerType())
        {
            bindStmtToStack(unaryExprOrTypeTraitExpr, new Object(sizeof(void *)));
        }
    }
    else
    {
        assert(0);
    }
}

void Environment::parenExpr(ParenExpr *parenExpr)
{
    mStack.back().setPC(parenExpr);

    const Type *type = parenExpr->getType().getTypePtr();
    if (const BuiltinType *builtinType = dyn_cast<BuiltinType>(type))
    {
        if (builtinType->getKind() == BuiltinType::Kind::Int)
        {
            bindStmtToStack(parenExpr, new Object(getStmtVal(parenExpr->getSubExpr())->getInt32()));
        }
        else
            assert(0);
    }
    else if (const PointerType *pointerType = dyn_cast<PointerType>(type))
    {
        bindStmtToStack(parenExpr, new Object(getStmtVal(parenExpr->getSubExpr())->getPointer()));
    }
    else
        assert(0);
}