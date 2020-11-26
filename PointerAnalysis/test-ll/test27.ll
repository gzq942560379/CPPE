; ModuleID = './assign3-tests/test27.c'
source_filename = "./assign3-tests/test27.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

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
define dso_local i32 @foo(i32 %0, i32 %1, %struct.fptr* %2) #0 !dbg !29 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.fptr*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !39, metadata !DIExpression()), !dbg !40
  store %struct.fptr* %2, %struct.fptr** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %6, metadata !41, metadata !DIExpression()), !dbg !42
  %7 = load %struct.fptr*, %struct.fptr** %6, align 8, !dbg !43
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %7, i32 0, i32 0, !dbg !44
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !44
  %10 = load i32, i32* %4, align 4, !dbg !45
  %11 = load i32, i32* %5, align 4, !dbg !46
  %12 = call i32 %9(i32 %10, i32 %11), !dbg !43
  ret i32 %12, !dbg !47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0, i32 %1, %struct.fptr* %2) #0 !dbg !48 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.fptr*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !51, metadata !DIExpression()), !dbg !52
  store %struct.fptr* %2, %struct.fptr** %6, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %6, metadata !53, metadata !DIExpression()), !dbg !54
  %7 = load %struct.fptr*, %struct.fptr** %6, align 8, !dbg !55
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %7, i32 0, i32 0, !dbg !56
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !57
  %9 = load i32, i32* %4, align 4, !dbg !58
  %10 = load i32, i32* %5, align 4, !dbg !59
  %11 = load %struct.fptr*, %struct.fptr** %6, align 8, !dbg !60
  %12 = call i32 @foo(i32 %9, i32 %10, %struct.fptr* %11), !dbg !61
  ret i32 %12, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !63 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca %struct.fptr, align 8
  %11 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata %struct.fptr* %10, metadata !79, metadata !DIExpression()), !dbg !80
  %12 = getelementptr inbounds %struct.fptr, %struct.fptr* %10, i32 0, i32 0, !dbg !81
  store i32 (i32, i32)* null, i32 (i32, i32)** %12, align 8, !dbg !82
  %13 = load i8, i8* %4, align 1, !dbg !83
  %14 = sext i8 %13 to i32, !dbg !83
  %15 = icmp eq i32 %14, 43, !dbg !85
  br i1 %15, label %16, label %18, !dbg !86

16:                                               ; preds = %3
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !87
  store i32 (i32, i32)* %17, i32 (i32, i32)** %9, align 8, !dbg !89
  br label %25, !dbg !90

18:                                               ; preds = %3
  %19 = load i8, i8* %4, align 1, !dbg !91
  %20 = sext i8 %19 to i32, !dbg !91
  %21 = icmp eq i32 %20, 45, !dbg !93
  br i1 %21, label %22, label %24, !dbg !94

22:                                               ; preds = %18
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !95
  store i32 (i32, i32)* %23, i32 (i32, i32)** %9, align 8, !dbg !97
  br label %24, !dbg !98

24:                                               ; preds = %22, %18
  br label %25

25:                                               ; preds = %24, %16
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !99
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %10, i32 0, i32 0, !dbg !100
  store i32 (i32, i32)* %26, i32 (i32, i32)** %27, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %11, metadata !102, metadata !DIExpression()), !dbg !104
  %28 = load i32, i32* %5, align 4, !dbg !105
  %29 = load i32, i32* %6, align 4, !dbg !106
  %30 = call i32 @clever(i32 %28, i32 %29, %struct.fptr* %10), !dbg !107
  store i32 %30, i32* %11, align 4, !dbg !104
  ret i32 0, !dbg !108
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test27.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign3-tests/test27.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !8, line: 14, type: !11)
!13 = !DILocation(line: 14, column: 14, scope: !7)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !8, line: 14, type: !11)
!15 = !DILocation(line: 14, column: 21, scope: !7)
!16 = !DILocation(line: 15, column: 11, scope: !7)
!17 = !DILocation(line: 15, column: 13, scope: !7)
!18 = !DILocation(line: 15, column: 12, scope: !7)
!19 = !DILocation(line: 15, column: 4, scope: !7)
!20 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !8, line: 18, type: !11)
!22 = !DILocation(line: 18, column: 15, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !8, line: 18, type: !11)
!24 = !DILocation(line: 18, column: 22, scope: !20)
!25 = !DILocation(line: 19, column: 11, scope: !20)
!26 = !DILocation(line: 19, column: 13, scope: !20)
!27 = !DILocation(line: 19, column: 12, scope: !20)
!28 = !DILocation(line: 19, column: 4, scope: !20)
!29 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 21, type: !30, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11, !11, !11, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !8, line: 2, size: 64, elements: !34)
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !33, file: !8, line: 4, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!37 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 21, type: !11)
!38 = !DILocation(line: 21, column: 13, scope: !29)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 21, type: !11)
!40 = !DILocation(line: 21, column: 20, scope: !29)
!41 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !29, file: !8, line: 21, type: !32)
!42 = !DILocation(line: 21, column: 36, scope: !29)
!43 = !DILocation(line: 22, column: 11, scope: !29)
!44 = !DILocation(line: 22, column: 19, scope: !29)
!45 = !DILocation(line: 22, column: 26, scope: !29)
!46 = !DILocation(line: 22, column: 29, scope: !29)
!47 = !DILocation(line: 22, column: 4, scope: !29)
!48 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 25, type: !30, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "a", arg: 1, scope: !48, file: !8, line: 25, type: !11)
!50 = !DILocation(line: 25, column: 16, scope: !48)
!51 = !DILocalVariable(name: "b", arg: 2, scope: !48, file: !8, line: 25, type: !11)
!52 = !DILocation(line: 25, column: 23, scope: !48)
!53 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !48, file: !8, line: 25, type: !32)
!54 = !DILocation(line: 25, column: 40, scope: !48)
!55 = !DILocation(line: 26, column: 4, scope: !48)
!56 = !DILocation(line: 26, column: 12, scope: !48)
!57 = !DILocation(line: 26, column: 18, scope: !48)
!58 = !DILocation(line: 27, column: 16, scope: !48)
!59 = !DILocation(line: 27, column: 19, scope: !48)
!60 = !DILocation(line: 27, column: 22, scope: !48)
!61 = !DILocation(line: 27, column: 12, scope: !48)
!62 = !DILocation(line: 27, column: 5, scope: !48)
!63 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 31, type: !64, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!11, !66, !11, !11}
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "x", arg: 1, scope: !63, file: !8, line: 31, type: !66)
!68 = !DILocation(line: 31, column: 14, scope: !63)
!69 = !DILocalVariable(name: "op1", arg: 2, scope: !63, file: !8, line: 31, type: !11)
!70 = !DILocation(line: 31, column: 21, scope: !63)
!71 = !DILocalVariable(name: "op2", arg: 3, scope: !63, file: !8, line: 31, type: !11)
!72 = !DILocation(line: 31, column: 30, scope: !63)
!73 = !DILocalVariable(name: "a_fptr", scope: !63, file: !8, line: 32, type: !36)
!74 = !DILocation(line: 32, column: 11, scope: !63)
!75 = !DILocalVariable(name: "s_fptr", scope: !63, file: !8, line: 33, type: !36)
!76 = !DILocation(line: 33, column: 11, scope: !63)
!77 = !DILocalVariable(name: "t_fptr", scope: !63, file: !8, line: 34, type: !36)
!78 = !DILocation(line: 34, column: 11, scope: !63)
!79 = !DILocalVariable(name: "m_fptr", scope: !63, file: !8, line: 35, type: !33)
!80 = !DILocation(line: 35, column: 17, scope: !63)
!81 = !DILocation(line: 36, column: 12, scope: !63)
!82 = !DILocation(line: 36, column: 18, scope: !63)
!83 = !DILocation(line: 37, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !63, file: !8, line: 37, column: 9)
!85 = !DILocation(line: 37, column: 11, scope: !84)
!86 = !DILocation(line: 37, column: 9, scope: !63)
!87 = !DILocation(line: 38, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !8, line: 37, column: 19)
!89 = !DILocation(line: 38, column: 15, scope: !88)
!90 = !DILocation(line: 39, column: 5, scope: !88)
!91 = !DILocation(line: 40, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !8, line: 40, column: 14)
!93 = !DILocation(line: 40, column: 16, scope: !92)
!94 = !DILocation(line: 40, column: 14, scope: !84)
!95 = !DILocation(line: 41, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !8, line: 40, column: 24)
!97 = !DILocation(line: 41, column: 15, scope: !96)
!98 = !DILocation(line: 42, column: 5, scope: !96)
!99 = !DILocation(line: 43, column: 19, scope: !63)
!100 = !DILocation(line: 43, column: 12, scope: !63)
!101 = !DILocation(line: 43, column: 18, scope: !63)
!102 = !DILocalVariable(name: "result", scope: !63, file: !8, line: 44, type: !103)
!103 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!104 = !DILocation(line: 44, column: 14, scope: !63)
!105 = !DILocation(line: 44, column: 30, scope: !63)
!106 = !DILocation(line: 44, column: 35, scope: !63)
!107 = !DILocation(line: 44, column: 23, scope: !63)
!108 = !DILocation(line: 45, column: 5, scope: !63)
