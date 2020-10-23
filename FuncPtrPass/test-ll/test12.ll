; ModuleID = './assign2-tests/test12.c'
source_filename = "./assign2-tests/test12.c"
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
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !29 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !39, metadata !DIExpression()), !dbg !40
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !41
  ret i32 (i32, i32)* %9, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !43 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !54, metadata !DIExpression()), !dbg !55
  %10 = load i32, i32* %5, align 4, !dbg !56
  %11 = load i32, i32* %6, align 4, !dbg !57
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !58
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !59
  %14 = call i32 (i32, i32)* @foo(i32 %10, i32 %11, i32 (i32, i32)* %12, i32 (i32, i32)* %13), !dbg !60
  store i32 (i32, i32)* %14, i32 (i32, i32)** %9, align 8, !dbg !61
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !62
  %16 = load i32, i32* %5, align 4, !dbg !63
  %17 = load i32, i32* %6, align 4, !dbg !64
  %18 = call i32 %15(i32 %16, i32 %17), !dbg !62
  ret i32 %18, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !66 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !81
  %11 = load i8, i8* %4, align 1, !dbg !82
  %12 = sext i8 %11 to i32, !dbg !82
  %13 = icmp eq i32 %12, 43, !dbg !84
  br i1 %13, label %14, label %16, !dbg !85

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !86
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !88
  br label %23, !dbg !89

16:                                               ; preds = %3
  %17 = load i8, i8* %4, align 1, !dbg !90
  %18 = sext i8 %17 to i32, !dbg !90
  %19 = icmp eq i32 %18, 45, !dbg !92
  br i1 %19, label %20, label %22, !dbg !93

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !94
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !96
  br label %22, !dbg !97

22:                                               ; preds = %20, %16
  br label %23

23:                                               ; preds = %22, %14
  call void @llvm.dbg.declare(metadata i32* %10, metadata !98, metadata !DIExpression()), !dbg !100
  %24 = load i32, i32* %5, align 4, !dbg !101
  %25 = load i32, i32* %6, align 4, !dbg !102
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !103
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !104
  %28 = call i32 @clever(i32 %24, i32 %25, i32 (i32, i32)* %26, i32 (i32, i32)* %27), !dbg !105
  store i32 %28, i32* %10, align 4, !dbg !100
  ret i32 0, !dbg !106
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test12.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test12.c", directory: "/home/gzq/CPPE/FuncPtrPass")
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
!29 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 9, type: !30, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!32, !11, !11, !32, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 9, type: !11)
!34 = !DILocation(line: 9, column: 15, scope: !29)
!35 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 9, type: !11)
!36 = !DILocation(line: 9, column: 22, scope: !29)
!37 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !29, file: !8, line: 9, type: !32)
!38 = !DILocation(line: 9, column: 31, scope: !29)
!39 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !29, file: !8, line: 9, type: !32)
!40 = !DILocation(line: 9, column: 55, scope: !29)
!41 = !DILocation(line: 10, column: 11, scope: !29)
!42 = !DILocation(line: 10, column: 4, scope: !29)
!43 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 13, type: !44, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11, !11, !11, !32, !32}
!46 = !DILocalVariable(name: "a", arg: 1, scope: !43, file: !8, line: 13, type: !11)
!47 = !DILocation(line: 13, column: 16, scope: !43)
!48 = !DILocalVariable(name: "b", arg: 2, scope: !43, file: !8, line: 13, type: !11)
!49 = !DILocation(line: 13, column: 23, scope: !43)
!50 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !43, file: !8, line: 13, type: !32)
!51 = !DILocation(line: 13, column: 32, scope: !43)
!52 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !43, file: !8, line: 13, type: !32)
!53 = !DILocation(line: 13, column: 56, scope: !43)
!54 = !DILocalVariable(name: "s_fptr", scope: !43, file: !8, line: 14, type: !32)
!55 = !DILocation(line: 14, column: 10, scope: !43)
!56 = !DILocation(line: 15, column: 17, scope: !43)
!57 = !DILocation(line: 15, column: 20, scope: !43)
!58 = !DILocation(line: 15, column: 23, scope: !43)
!59 = !DILocation(line: 15, column: 31, scope: !43)
!60 = !DILocation(line: 15, column: 13, scope: !43)
!61 = !DILocation(line: 15, column: 11, scope: !43)
!62 = !DILocation(line: 16, column: 11, scope: !43)
!63 = !DILocation(line: 16, column: 18, scope: !43)
!64 = !DILocation(line: 16, column: 21, scope: !43)
!65 = !DILocation(line: 16, column: 4, scope: !43)
!66 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 20, type: !67, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!11, !69, !11, !11}
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "x", arg: 1, scope: !66, file: !8, line: 20, type: !69)
!71 = !DILocation(line: 20, column: 14, scope: !66)
!72 = !DILocalVariable(name: "op1", arg: 2, scope: !66, file: !8, line: 20, type: !11)
!73 = !DILocation(line: 20, column: 21, scope: !66)
!74 = !DILocalVariable(name: "op2", arg: 3, scope: !66, file: !8, line: 20, type: !11)
!75 = !DILocation(line: 20, column: 30, scope: !66)
!76 = !DILocalVariable(name: "a_fptr", scope: !66, file: !8, line: 21, type: !32)
!77 = !DILocation(line: 21, column: 11, scope: !66)
!78 = !DILocalVariable(name: "s_fptr", scope: !66, file: !8, line: 22, type: !32)
!79 = !DILocation(line: 22, column: 11, scope: !66)
!80 = !DILocalVariable(name: "t_fptr", scope: !66, file: !8, line: 23, type: !32)
!81 = !DILocation(line: 23, column: 11, scope: !66)
!82 = !DILocation(line: 25, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !66, file: !8, line: 25, column: 9)
!84 = !DILocation(line: 25, column: 11, scope: !83)
!85 = !DILocation(line: 25, column: 9, scope: !66)
!86 = !DILocation(line: 26, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !8, line: 25, column: 19)
!88 = !DILocation(line: 26, column: 15, scope: !87)
!89 = !DILocation(line: 27, column: 5, scope: !87)
!90 = !DILocation(line: 28, column: 14, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !8, line: 28, column: 14)
!92 = !DILocation(line: 28, column: 16, scope: !91)
!93 = !DILocation(line: 28, column: 14, scope: !83)
!94 = !DILocation(line: 29, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !8, line: 28, column: 24)
!96 = !DILocation(line: 29, column: 15, scope: !95)
!97 = !DILocation(line: 30, column: 5, scope: !95)
!98 = !DILocalVariable(name: "result", scope: !66, file: !8, line: 32, type: !99)
!99 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!100 = !DILocation(line: 32, column: 14, scope: !66)
!101 = !DILocation(line: 32, column: 30, scope: !66)
!102 = !DILocation(line: 32, column: 35, scope: !66)
!103 = !DILocation(line: 32, column: 40, scope: !66)
!104 = !DILocation(line: 32, column: 48, scope: !66)
!105 = !DILocation(line: 32, column: 23, scope: !66)
!106 = !DILocation(line: 33, column: 5, scope: !66)
