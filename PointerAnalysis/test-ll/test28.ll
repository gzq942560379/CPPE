; ModuleID = './assign3-tests/test28.c'
source_filename = "./assign3-tests/test28.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !13 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !18
  %5 = load i32, i32* %3, align 4, !dbg !19
  %6 = load i32, i32* %4, align 4, !dbg !20
  %7 = add nsw i32 %5, %6, !dbg !21
  ret i32 %7, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !26, metadata !DIExpression()), !dbg !27
  %5 = load i32, i32* %3, align 4, !dbg !28
  %6 = load i32, i32* %4, align 4, !dbg !29
  %7 = sub nsw i32 %5, %6, !dbg !30
  ret i32 %7, !dbg !31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)** %2, i32 (i32, i32)** %3) #0 !dbg !32 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)**, align 8
  %8 = alloca i32 (i32, i32)**, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)** %2, i32 (i32, i32)*** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %7, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)** %3, i32 (i32, i32)*** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %8, metadata !41, metadata !DIExpression()), !dbg !42
  %9 = load i32 (i32, i32)**, i32 (i32, i32)*** %8, align 8, !dbg !43
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !44
  %11 = load i32, i32* %5, align 4, !dbg !45
  %12 = load i32, i32* %6, align 4, !dbg !46
  %13 = call i32 %10(i32 %11, i32 %12), !dbg !47
  ret i32 %13, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)** %2, i32 (i32, i32)** %3) #0 !dbg !49 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)**, align 8
  %8 = alloca i32 (i32, i32)**, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 (i32, i32)** %2, i32 (i32, i32)*** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %7, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 (i32, i32)** %3, i32 (i32, i32)*** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %8, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !58, metadata !DIExpression()), !dbg !59
  %10 = load i32 (i32, i32)**, i32 (i32, i32)*** %7, align 8, !dbg !60
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !61
  store i32 (i32, i32)* %11, i32 (i32, i32)** %9, align 8, !dbg !59
  %12 = load i32 (i32, i32)**, i32 (i32, i32)*** %8, align 8, !dbg !62
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %12, align 8, !dbg !63
  %14 = load i32 (i32, i32)**, i32 (i32, i32)*** %7, align 8, !dbg !64
  store i32 (i32, i32)* %13, i32 (i32, i32)** %14, align 8, !dbg !65
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !66
  %16 = load i32 (i32, i32)**, i32 (i32, i32)*** %8, align 8, !dbg !67
  store i32 (i32, i32)* %15, i32 (i32, i32)** %16, align 8, !dbg !68
  %17 = load i32, i32* %5, align 4, !dbg !69
  %18 = load i32, i32* %6, align 4, !dbg !70
  %19 = load i32 (i32, i32)**, i32 (i32, i32)*** %7, align 8, !dbg !71
  %20 = load i32 (i32, i32)**, i32 (i32, i32)*** %8, align 8, !dbg !72
  %21 = call i32 @foo(i32 %17, i32 %18, i32 (i32, i32)** %19, i32 (i32, i32)** %20), !dbg !73
  ret i32 %21, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !75 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)**, align 8
  %8 = alloca i32 (i32, i32)**, align 8
  %9 = alloca i32 (i32, i32)**, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %7, metadata !85, metadata !DIExpression()), !dbg !86
  %11 = call noalias i8* @malloc(i64 8) #3, !dbg !87
  %12 = bitcast i8* %11 to i32 (i32, i32)**, !dbg !88
  store i32 (i32, i32)** %12, i32 (i32, i32)*** %7, align 8, !dbg !86
  %13 = load i32 (i32, i32)**, i32 (i32, i32)*** %7, align 8, !dbg !89
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %13, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %8, metadata !91, metadata !DIExpression()), !dbg !92
  %14 = call noalias i8* @malloc(i64 8) #3, !dbg !93
  %15 = bitcast i8* %14 to i32 (i32, i32)**, !dbg !94
  store i32 (i32, i32)** %15, i32 (i32, i32)*** %8, align 8, !dbg !92
  %16 = load i32 (i32, i32)**, i32 (i32, i32)*** %8, align 8, !dbg !95
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %16, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %9, metadata !97, metadata !DIExpression()), !dbg !98
  %17 = call noalias i8* @malloc(i64 8) #3, !dbg !99
  %18 = bitcast i8* %17 to i32 (i32, i32)**, !dbg !100
  store i32 (i32, i32)** %18, i32 (i32, i32)*** %9, align 8, !dbg !98
  %19 = load i8, i8* %4, align 1, !dbg !101
  %20 = sext i8 %19 to i32, !dbg !101
  %21 = icmp eq i32 %20, 43, !dbg !103
  br i1 %21, label %22, label %24, !dbg !104

22:                                               ; preds = %3
  %23 = load i32 (i32, i32)**, i32 (i32, i32)*** %7, align 8, !dbg !105
  store i32 (i32, i32)** %23, i32 (i32, i32)*** %9, align 8, !dbg !107
  br label %31, !dbg !108

24:                                               ; preds = %3
  %25 = load i8, i8* %4, align 1, !dbg !109
  %26 = sext i8 %25 to i32, !dbg !109
  %27 = icmp eq i32 %26, 45, !dbg !111
  br i1 %27, label %28, label %30, !dbg !112

28:                                               ; preds = %24
  %29 = load i32 (i32, i32)**, i32 (i32, i32)*** %8, align 8, !dbg !113
  store i32 (i32, i32)** %29, i32 (i32, i32)*** %9, align 8, !dbg !115
  br label %30, !dbg !116

30:                                               ; preds = %28, %24
  br label %31

31:                                               ; preds = %30, %22
  call void @llvm.dbg.declare(metadata i32* %10, metadata !117, metadata !DIExpression()), !dbg !119
  %32 = load i32, i32* %5, align 4, !dbg !120
  %33 = load i32, i32* %6, align 4, !dbg !121
  %34 = load i32 (i32, i32)**, i32 (i32, i32)*** %7, align 8, !dbg !122
  %35 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !123
  %36 = call i32 @clever(i32 %32, i32 %33, i32 (i32, i32)** %34, i32 (i32, i32)** %35), !dbg !124
  store i32 %36, i32* %10, align 4, !dbg !119
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test28.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !8, !8}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "plus", scope: !14, file: !14, line: 14, type: !6, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./assign3-tests/test28.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!15 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !14, line: 14, type: !8)
!16 = !DILocation(line: 14, column: 14, scope: !13)
!17 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !14, line: 14, type: !8)
!18 = !DILocation(line: 14, column: 21, scope: !13)
!19 = !DILocation(line: 15, column: 11, scope: !13)
!20 = !DILocation(line: 15, column: 13, scope: !13)
!21 = !DILocation(line: 15, column: 12, scope: !13)
!22 = !DILocation(line: 15, column: 4, scope: !13)
!23 = distinct !DISubprogram(name: "minus", scope: !14, file: !14, line: 18, type: !6, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !14, line: 18, type: !8)
!25 = !DILocation(line: 18, column: 15, scope: !23)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !23, file: !14, line: 18, type: !8)
!27 = !DILocation(line: 18, column: 22, scope: !23)
!28 = !DILocation(line: 19, column: 11, scope: !23)
!29 = !DILocation(line: 19, column: 13, scope: !23)
!30 = !DILocation(line: 19, column: 12, scope: !23)
!31 = !DILocation(line: 19, column: 4, scope: !23)
!32 = distinct !DISubprogram(name: "foo", scope: !14, file: !14, line: 21, type: !33, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!8, !8, !8, !4, !4}
!35 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !14, line: 21, type: !8)
!36 = !DILocation(line: 21, column: 13, scope: !32)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !14, line: 21, type: !8)
!38 = !DILocation(line: 21, column: 20, scope: !32)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !32, file: !14, line: 21, type: !4)
!40 = !DILocation(line: 21, column: 30, scope: !32)
!41 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !32, file: !14, line: 21, type: !4)
!42 = !DILocation(line: 21, column: 55, scope: !32)
!43 = !DILocation(line: 22, column: 13, scope: !32)
!44 = !DILocation(line: 22, column: 12, scope: !32)
!45 = !DILocation(line: 22, column: 21, scope: !32)
!46 = !DILocation(line: 22, column: 24, scope: !32)
!47 = !DILocation(line: 22, column: 11, scope: !32)
!48 = !DILocation(line: 22, column: 4, scope: !32)
!49 = distinct !DISubprogram(name: "clever", scope: !14, file: !14, line: 25, type: !33, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "a", arg: 1, scope: !49, file: !14, line: 25, type: !8)
!51 = !DILocation(line: 25, column: 16, scope: !49)
!52 = !DILocalVariable(name: "b", arg: 2, scope: !49, file: !14, line: 25, type: !8)
!53 = !DILocation(line: 25, column: 23, scope: !49)
!54 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !49, file: !14, line: 25, type: !4)
!55 = !DILocation(line: 25, column: 33, scope: !49)
!56 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !49, file: !14, line: 25, type: !4)
!57 = !DILocation(line: 25, column: 58, scope: !49)
!58 = !DILocalVariable(name: "t_fptr", scope: !49, file: !14, line: 26, type: !5)
!59 = !DILocation(line: 26, column: 8, scope: !49)
!60 = !DILocation(line: 26, column: 27, scope: !49)
!61 = !DILocation(line: 26, column: 26, scope: !49)
!62 = !DILocation(line: 27, column: 11, scope: !49)
!63 = !DILocation(line: 27, column: 10, scope: !49)
!64 = !DILocation(line: 27, column: 3, scope: !49)
!65 = !DILocation(line: 27, column: 9, scope: !49)
!66 = !DILocation(line: 28, column: 10, scope: !49)
!67 = !DILocation(line: 28, column: 3, scope: !49)
!68 = !DILocation(line: 28, column: 9, scope: !49)
!69 = !DILocation(line: 29, column: 16, scope: !49)
!70 = !DILocation(line: 29, column: 19, scope: !49)
!71 = !DILocation(line: 29, column: 22, scope: !49)
!72 = !DILocation(line: 29, column: 30, scope: !49)
!73 = !DILocation(line: 29, column: 12, scope: !49)
!74 = !DILocation(line: 29, column: 5, scope: !49)
!75 = distinct !DISubprogram(name: "moo", scope: !14, file: !14, line: 33, type: !76, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!8, !78, !8, !8}
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "x", arg: 1, scope: !75, file: !14, line: 33, type: !78)
!80 = !DILocation(line: 33, column: 14, scope: !75)
!81 = !DILocalVariable(name: "op1", arg: 2, scope: !75, file: !14, line: 33, type: !8)
!82 = !DILocation(line: 33, column: 21, scope: !75)
!83 = !DILocalVariable(name: "op2", arg: 3, scope: !75, file: !14, line: 33, type: !8)
!84 = !DILocation(line: 33, column: 30, scope: !75)
!85 = !DILocalVariable(name: "a_fptr", scope: !75, file: !14, line: 34, type: !4)
!86 = !DILocation(line: 34, column: 9, scope: !75)
!87 = !DILocation(line: 34, column: 49, scope: !75)
!88 = !DILocation(line: 34, column: 29, scope: !75)
!89 = !DILocation(line: 35, column: 6, scope: !75)
!90 = !DILocation(line: 35, column: 12, scope: !75)
!91 = !DILocalVariable(name: "s_fptr", scope: !75, file: !14, line: 36, type: !4)
!92 = !DILocation(line: 36, column: 12, scope: !75)
!93 = !DILocation(line: 36, column: 52, scope: !75)
!94 = !DILocation(line: 36, column: 32, scope: !75)
!95 = !DILocation(line: 37, column: 6, scope: !75)
!96 = !DILocation(line: 37, column: 13, scope: !75)
!97 = !DILocalVariable(name: "t_fptr", scope: !75, file: !14, line: 38, type: !4)
!98 = !DILocation(line: 38, column: 12, scope: !75)
!99 = !DILocation(line: 38, column: 52, scope: !75)
!100 = !DILocation(line: 38, column: 32, scope: !75)
!101 = !DILocation(line: 40, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !75, file: !14, line: 40, column: 9)
!103 = !DILocation(line: 40, column: 11, scope: !102)
!104 = !DILocation(line: 40, column: 9, scope: !75)
!105 = !DILocation(line: 41, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !14, line: 40, column: 19)
!107 = !DILocation(line: 41, column: 15, scope: !106)
!108 = !DILocation(line: 42, column: 5, scope: !106)
!109 = !DILocation(line: 43, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !14, line: 43, column: 14)
!111 = !DILocation(line: 43, column: 16, scope: !110)
!112 = !DILocation(line: 43, column: 14, scope: !102)
!113 = !DILocation(line: 44, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !14, line: 43, column: 24)
!115 = !DILocation(line: 44, column: 15, scope: !114)
!116 = !DILocation(line: 45, column: 5, scope: !114)
!117 = !DILocalVariable(name: "result", scope: !75, file: !14, line: 47, type: !118)
!118 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!119 = !DILocation(line: 47, column: 14, scope: !75)
!120 = !DILocation(line: 47, column: 30, scope: !75)
!121 = !DILocation(line: 47, column: 35, scope: !75)
!122 = !DILocation(line: 47, column: 40, scope: !75)
!123 = !DILocation(line: 47, column: 48, scope: !75)
!124 = !DILocation(line: 47, column: 23, scope: !75)
!125 = !DILocation(line: 48, column: 5, scope: !75)
