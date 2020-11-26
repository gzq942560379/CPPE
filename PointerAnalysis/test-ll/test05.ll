; ModuleID = './assign3-tests/test05.c'
source_filename = "./assign3-tests/test05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !16, metadata !DIExpression()), !dbg !17
  %5 = load i32, i32* %3, align 4, !dbg !18
  %6 = load i32, i32* %4, align 4, !dbg !19
  %7 = add nsw i32 %5, %6, !dbg !20
  ret i32 %7, !dbg !21
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !22 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !25, metadata !DIExpression()), !dbg !26
  %5 = load i32, i32* %3, align 4, !dbg !27
  %6 = load i32, i32* %4, align 4, !dbg !28
  %7 = sub nsw i32 %5, %6, !dbg !29
  ret i32 %7, !dbg !30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !31 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca [2 x i32 (i32, i32)*], align 16
  %6 = alloca [1 x i32 (i32, i32)*], align 8
  %7 = alloca [2 x i32 (i32, i32)*], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %5, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [1 x i32 (i32, i32)*]* %6, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %7, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %8, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 1, i32* %8, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %9, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 2, i32* %9, align 4, !dbg !56
  %11 = load i32, i32* %2, align 4, !dbg !57
  %12 = icmp sge i32 %11, 3, !dbg !59
  br i1 %12, label %13, label %16, !dbg !60

13:                                               ; preds = %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !61
  %15 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !63
  store i32 (i32, i32)* %14, i32 (i32, i32)** %15, align 8, !dbg !64
  br label %16, !dbg !65

16:                                               ; preds = %13, %1
  %17 = load i32, i32* %2, align 4, !dbg !66
  %18 = icmp sge i32 %17, 4, !dbg !68
  br i1 %18, label %19, label %22, !dbg !69

19:                                               ; preds = %16
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !70
  %21 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !72
  store i32 (i32, i32)* %20, i32 (i32, i32)** %21, align 8, !dbg !73
  br label %22, !dbg !74

22:                                               ; preds = %19, %16
  %23 = load i32, i32* %2, align 4, !dbg !75
  %24 = icmp sge i32 %23, 5, !dbg !77
  br i1 %24, label %25, label %29, !dbg !78

25:                                               ; preds = %22
  %26 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !79
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %26, align 8, !dbg !79
  %28 = getelementptr inbounds [1 x i32 (i32, i32)*], [1 x i32 (i32, i32)*]* %6, i64 0, i64 0, !dbg !81
  store i32 (i32, i32)* %27, i32 (i32, i32)** %28, align 8, !dbg !82
  br label %29, !dbg !83

29:                                               ; preds = %25, %22
  %30 = load i32, i32* %2, align 4, !dbg !84
  %31 = icmp sge i32 %30, 6, !dbg !86
  br i1 %31, label %32, label %36, !dbg !87

32:                                               ; preds = %29
  %33 = getelementptr inbounds [1 x i32 (i32, i32)*], [1 x i32 (i32, i32)*]* %6, i64 0, i64 0, !dbg !88
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %33, align 8, !dbg !88
  %35 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %7, i64 0, i64 1, !dbg !89
  store i32 (i32, i32)* %34, i32 (i32, i32)** %35, align 8, !dbg !90
  br label %36, !dbg !89

36:                                               ; preds = %32, %29
  %37 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !91
  %38 = load i32 (i32, i32)*, i32 (i32, i32)** %37, align 8, !dbg !91
  %39 = icmp ne i32 (i32, i32)* %38, null, !dbg !93
  br i1 %39, label %40, label %46, !dbg !94

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i32* %10, metadata !95, metadata !DIExpression()), !dbg !98
  %41 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %7, i64 0, i64 1, !dbg !99
  %42 = load i32 (i32, i32)*, i32 (i32, i32)** %41, align 8, !dbg !99
  %43 = load i32, i32* %8, align 4, !dbg !100
  %44 = load i32, i32* %9, align 4, !dbg !101
  %45 = call i32 %42(i32 %43, i32 %44), !dbg !99
  store i32 %45, i32* %10, align 4, !dbg !98
  br label %46, !dbg !102

46:                                               ; preds = %40, %36
  ret i32 0, !dbg !103
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test05.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "plus", scope: !10, file: !10, line: 2, type: !11, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./assign3-tests/test05.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 2, type: !13)
!15 = !DILocation(line: 2, column: 14, scope: !9)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !10, line: 2, type: !13)
!17 = !DILocation(line: 2, column: 21, scope: !9)
!18 = !DILocation(line: 3, column: 11, scope: !9)
!19 = !DILocation(line: 3, column: 13, scope: !9)
!20 = !DILocation(line: 3, column: 12, scope: !9)
!21 = !DILocation(line: 3, column: 4, scope: !9)
!22 = distinct !DISubprogram(name: "minus", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !10, line: 6, type: !13)
!24 = !DILocation(line: 6, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !10, line: 6, type: !13)
!26 = !DILocation(line: 6, column: 22, scope: !22)
!27 = !DILocation(line: 7, column: 11, scope: !22)
!28 = !DILocation(line: 7, column: 13, scope: !22)
!29 = !DILocation(line: 7, column: 12, scope: !22)
!30 = !DILocation(line: 7, column: 4, scope: !22)
!31 = distinct !DISubprogram(name: "clever", scope: !10, file: !10, line: 10, type: !32, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!13, !13}
!34 = !DILocalVariable(name: "x", arg: 1, scope: !31, file: !10, line: 10, type: !13)
!35 = !DILocation(line: 10, column: 16, scope: !31)
!36 = !DILocalVariable(name: "a_fptr", scope: !31, file: !10, line: 11, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!38 = !DILocation(line: 11, column: 11, scope: !31)
!39 = !DILocalVariable(name: "s_fptr", scope: !31, file: !10, line: 12, type: !37)
!40 = !DILocation(line: 12, column: 11, scope: !31)
!41 = !DILocalVariable(name: "t_fptr", scope: !31, file: !10, line: 13, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 128, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 2)
!45 = !DILocation(line: 13, column: 11, scope: !31)
!46 = !DILocalVariable(name: "q_fptr", scope: !31, file: !10, line: 14, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 64, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 1)
!50 = !DILocation(line: 14, column: 11, scope: !31)
!51 = !DILocalVariable(name: "r_fptr", scope: !31, file: !10, line: 15, type: !42)
!52 = !DILocation(line: 15, column: 11, scope: !31)
!53 = !DILocalVariable(name: "op1", scope: !31, file: !10, line: 17, type: !13)
!54 = !DILocation(line: 17, column: 9, scope: !31)
!55 = !DILocalVariable(name: "op2", scope: !31, file: !10, line: 17, type: !13)
!56 = !DILocation(line: 17, column: 16, scope: !31)
!57 = !DILocation(line: 19, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !31, file: !10, line: 19, column: 9)
!59 = !DILocation(line: 19, column: 11, scope: !58)
!60 = !DILocation(line: 19, column: 9, scope: !31)
!61 = !DILocation(line: 20, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !10, line: 19, column: 17)
!63 = !DILocation(line: 20, column: 8, scope: !62)
!64 = !DILocation(line: 20, column: 18, scope: !62)
!65 = !DILocation(line: 21, column: 5, scope: !62)
!66 = !DILocation(line: 22, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !31, file: !10, line: 22, column: 9)
!68 = !DILocation(line: 22, column: 11, scope: !67)
!69 = !DILocation(line: 22, column: 9, scope: !31)
!70 = !DILocation(line: 23, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !10, line: 22, column: 17)
!72 = !DILocation(line: 23, column: 8, scope: !71)
!73 = !DILocation(line: 23, column: 18, scope: !71)
!74 = !DILocation(line: 24, column: 5, scope: !71)
!75 = !DILocation(line: 25, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !31, file: !10, line: 25, column: 9)
!77 = !DILocation(line: 25, column: 11, scope: !76)
!78 = !DILocation(line: 25, column: 9, scope: !31)
!79 = !DILocation(line: 26, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !10, line: 25, column: 17)
!81 = !DILocation(line: 26, column: 8, scope: !80)
!82 = !DILocation(line: 26, column: 18, scope: !80)
!83 = !DILocation(line: 27, column: 5, scope: !80)
!84 = !DILocation(line: 28, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !31, file: !10, line: 28, column: 9)
!86 = !DILocation(line: 28, column: 11, scope: !85)
!87 = !DILocation(line: 28, column: 9, scope: !31)
!88 = !DILocation(line: 29, column: 20, scope: !85)
!89 = !DILocation(line: 29, column: 8, scope: !85)
!90 = !DILocation(line: 29, column: 18, scope: !85)
!91 = !DILocation(line: 32, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !31, file: !10, line: 32, column: 9)
!93 = !DILocation(line: 32, column: 19, scope: !92)
!94 = !DILocation(line: 32, column: 9, scope: !31)
!95 = !DILocalVariable(name: "result", scope: !96, file: !10, line: 33, type: !97)
!96 = distinct !DILexicalBlock(scope: !92, file: !10, line: 32, column: 28)
!97 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!98 = !DILocation(line: 33, column: 17, scope: !96)
!99 = !DILocation(line: 33, column: 26, scope: !96)
!100 = !DILocation(line: 33, column: 36, scope: !96)
!101 = !DILocation(line: 33, column: 41, scope: !96)
!102 = !DILocation(line: 34, column: 5, scope: !96)
!103 = !DILocation(line: 35, column: 4, scope: !31)
