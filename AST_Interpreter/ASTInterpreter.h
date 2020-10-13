#pragma once

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/EvaluatedExprVisitor.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendAction.h"

using namespace clang;

#include "Environment.h"

#include "util.h"

class InterpreterVisitor : public EvaluatedExprVisitor<InterpreterVisitor>
{
public:
    explicit InterpreterVisitor(const ASTContext &context, Environment *env)
        : EvaluatedExprVisitor(context), mEnv(env) {}
    virtual ~InterpreterVisitor() {}

    virtual void VisitBinaryOperator(BinaryOperator *bop)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(bop);

#ifdef DEBUG
        bop->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->binop(bop);
    }
    virtual void VisitDeclRefExpr(DeclRefExpr *expr)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(expr);

#ifdef DEBUG
        expr->dumpColor();
        llvm::errs() << "\n";
#endif

        mEnv->declref(expr);
    }
    virtual void VisitCastExpr(CastExpr *expr)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(expr);
#ifdef DEBUG
        expr->dumpColor();
        llvm::errs() << "\n";
#endif

        mEnv->cast(expr);
    }
    virtual void VisitCallExpr(CallExpr *call)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(call);
#ifdef DEBUG
        call->dumpColor();
        llvm::errs() << "\n";
#endif

        mEnv->call(call);
    }
    virtual void VisitDeclStmt(DeclStmt *declstmt)
    {
        if (mEnv->hasReturn())
            return;
#ifdef DEBUG
        declstmt->dumpColor();
        llvm::errs() << "\n";
#endif

        mEnv->decl(declstmt);
    }

    // added visitor --------------------------------------------------------------------
    virtual void VisitIntegerLiteral(IntegerLiteral *integer)
    {
        if (mEnv->hasReturn())
            return;
#ifdef DEBUG
        integer->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->integerLiteral(integer);
    }

    virtual void VisitIfStmt(IfStmt *ifStmt)
    {
        if (mEnv->hasReturn())
            return;
        mEnv->ifStmt(ifStmt);
    }

    virtual void VisitReturnStmt(ReturnStmt *returnStmt)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(returnStmt);
#ifdef DEBUG
        returnStmt->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->returnStmt(returnStmt);
    }

    virtual void VisitUnaryOperator(UnaryOperator *unaryOperator)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(unaryOperator);
#ifdef DEBUG
        unaryOperator->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->unaryOperator(unaryOperator);
    }

    virtual void VisitWhileStmt(WhileStmt *whileStmt)
    {
        if (mEnv->hasReturn())
            return;
        mEnv->whileStmt(whileStmt);
    }

    virtual void VisitForStmt(ForStmt *forStmt)
    {
        if (mEnv->hasReturn())
            return;
        mEnv->forStmt(forStmt);
    }

    virtual void VisitArraySubscriptExpr(ArraySubscriptExpr *arraySubscriptExpr)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(arraySubscriptExpr);
#ifdef DEBUG
        arraySubscriptExpr->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->arraySubscriptExpr(arraySubscriptExpr);
    }

    virtual void VisitUnaryExprOrTypeTraitExpr(UnaryExprOrTypeTraitExpr *unaryExprOrTypeTraitExpr)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(unaryExprOrTypeTraitExpr);
#ifdef DEBUG
        unaryExprOrTypeTraitExpr->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->unaryExprOrTypeTraitExpr(unaryExprOrTypeTraitExpr);
    }

    virtual void VisitParenExpr(ParenExpr *parenExpr)
    {
        if (mEnv->hasReturn())
            return;
        VisitStmt(parenExpr);
#ifdef DEBUG
        parenExpr->dumpColor();
        llvm::errs() << "\n";
#endif
        mEnv->parenExpr(parenExpr);
    }
    // ----------------------------------------------------------------------------------

private:
    Environment *mEnv;
};

class InterpreterConsumer : public ASTConsumer
{
public:
    explicit InterpreterConsumer(const ASTContext &context) : mEnv(),
                                                              mVisitor(context, &mEnv)
    {
    }
    virtual ~InterpreterConsumer() {}

    virtual void HandleTranslationUnit(clang::ASTContext &Context)
    {
        mEnv.initAndRun(Context.getTranslationUnitDecl(), &mVisitor);
    }

private:
    Environment mEnv;
    InterpreterVisitor mVisitor;
};

class InterpreterClassAction : public ASTFrontendAction
{
public:
    virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
        clang::CompilerInstance &Compiler, llvm::StringRef InFile)
    {
        return std::unique_ptr<clang::ASTConsumer>(
            new InterpreterConsumer(Compiler.getASTContext()));
    }
};