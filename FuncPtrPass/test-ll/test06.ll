; ModuleID = './assign2-tests/test06.c'
source_filename = "./assign2-tests/test06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !14, metadata !DIExpression()), !dbg !15
  %5 = load i32, i32* %3, align 4, !dbg !16
  %6 = load i32, i32* %4, align 4, !dbg !17
  %7 = add nsw i32 %5, %6, !dbg !18
  ret i32 %7, !dbg !19
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !20 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !23, metadata !DIExpression()), !dbg !24
  %5 = load i32, i32* %3, align 4, !dbg !25
  %6 = load i32, i32* %4, align 4, !dbg !26
  %7 = sub nsw i32 %5, %6, !dbg !27
  ret i32 %7, !dbg !28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !29 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !37, metadata !DIExpression()), !dbg !38
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !39
  %8 = load i32, i32* %4, align 4, !dbg !40
  %9 = load i32, i32* %5, align 4, !dbg !41
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !39
  ret i32 %10, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !43 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !58
  %11 = load i8, i8* %4, align 1, !dbg !59
  %12 = sext i8 %11 to i32, !dbg !59
  %13 = icmp eq i32 %12, 43, !dbg !61
  br i1 %13, label %14, label %16, !dbg !62

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !63
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !65
  br label %16, !dbg !66

16:                                               ; preds = %14, %3
  %17 = load i8, i8* %4, align 1, !dbg !67
  %18 = sext i8 %17 to i32, !dbg !67
  %19 = icmp eq i32 %18, 45, !dbg !69
  br i1 %19, label %20, label %22, !dbg !70

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !71
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !73
  br label %22, !dbg !74

22:                                               ; preds = %20, %16
  call void @llvm.dbg.declare(metadata i32* %10, metadata !75, metadata !DIExpression()), !dbg !77
  %23 = load i32, i32* %5, align 4, !dbg !78
  %24 = load i32, i32* %6, align 4, !dbg !79
  %25 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !80
  %26 = call i32 @clever(i32 %23, i32 %24, i32 (i32, i32)* %25), !dbg !81
  store i32 %26, i32* %10, align 4, !dbg !77
  ret i32 0, !dbg !82
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test06.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test06.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !8, line: 1, type: !11)
!13 = !DILocation(line: 1, column: 14, scope: !7)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !8, line: 1, type: !11)
!15 = !DILocation(line: 1, column: 21, scope: !7)
!16 = !DILocation(line: 2, column: 11, scope: !7)
!17 = !DILocation(line: 2, column: 13, scope: !7)
!18 = !DILocation(line: 2, column: 12, scope: !7)
!19 = !DILocation(line: 2, column: 4, scope: !7)
!20 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 5, type: !9, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !8, line: 5, type: !11)
!22 = !DILocation(line: 5, column: 15, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !8, line: 5, type: !11)
!24 = !DILocation(line: 5, column: 22, scope: !20)
!25 = !DILocation(line: 6, column: 11, scope: !20)
!26 = !DILocation(line: 6, column: 13, scope: !20)
!27 = !DILocation(line: 6, column: 12, scope: !20)
!28 = !DILocation(line: 6, column: 4, scope: !20)
!29 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 9, type: !30, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11, !11, !11, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 9, type: !11)
!34 = !DILocation(line: 9, column: 16, scope: !29)
!35 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 9, type: !11)
!36 = !DILocation(line: 9, column: 23, scope: !29)
!37 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !29, file: !8, line: 9, type: !32)
!38 = !DILocation(line: 9, column: 32, scope: !29)
!39 = !DILocation(line: 10, column: 12, scope: !29)
!40 = !DILocation(line: 10, column: 19, scope: !29)
!41 = !DILocation(line: 10, column: 22, scope: !29)
!42 = !DILocation(line: 10, column: 5, scope: !29)
!43 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 14, type: !44, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11, !46, !11, !11}
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !8, line: 14, type: !46)
!48 = !DILocation(line: 14, column: 14, scope: !43)
!49 = !DILocalVariable(name: "op1", arg: 2, scope: !43, file: !8, line: 14, type: !11)
!50 = !DILocation(line: 14, column: 21, scope: !43)
!51 = !DILocalVariable(name: "op2", arg: 3, scope: !43, file: !8, line: 14, type: !11)
!52 = !DILocation(line: 14, column: 30, scope: !43)
!53 = !DILocalVariable(name: "a_fptr", scope: !43, file: !8, line: 15, type: !32)
!54 = !DILocation(line: 15, column: 11, scope: !43)
!55 = !DILocalVariable(name: "s_fptr", scope: !43, file: !8, line: 16, type: !32)
!56 = !DILocation(line: 16, column: 11, scope: !43)
!57 = !DILocalVariable(name: "t_fptr", scope: !43, file: !8, line: 17, type: !32)
!58 = !DILocation(line: 17, column: 11, scope: !43)
!59 = !DILocation(line: 19, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !43, file: !8, line: 19, column: 9)
!61 = !DILocation(line: 19, column: 11, scope: !60)
!62 = !DILocation(line: 19, column: 9, scope: !43)
!63 = !DILocation(line: 20, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !8, line: 19, column: 19)
!65 = !DILocation(line: 20, column: 15, scope: !64)
!66 = !DILocation(line: 21, column: 5, scope: !64)
!67 = !DILocation(line: 22, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !43, file: !8, line: 22, column: 9)
!69 = !DILocation(line: 22, column: 11, scope: !68)
!70 = !DILocation(line: 22, column: 9, scope: !43)
!71 = !DILocation(line: 23, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !8, line: 22, column: 19)
!73 = !DILocation(line: 23, column: 15, scope: !72)
!74 = !DILocation(line: 24, column: 5, scope: !72)
!75 = !DILocalVariable(name: "result", scope: !43, file: !8, line: 26, type: !76)
!76 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 26, column: 14, scope: !43)
!78 = !DILocation(line: 26, column: 30, scope: !43)
!79 = !DILocation(line: 26, column: 35, scope: !43)
!80 = !DILocation(line: 26, column: 40, scope: !43)
!81 = !DILocation(line: 26, column: 23, scope: !43)
!82 = !DILocation(line: 27, column: 5, scope: !43)
