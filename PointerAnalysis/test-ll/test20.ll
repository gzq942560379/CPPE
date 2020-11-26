; ModuleID = './assign3-tests/test20.c'
source_filename = "./assign3-tests/test20.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }

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
define dso_local %struct.fptr* @foo(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !29 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fsptr*, align 8
  %8 = alloca %struct.fsptr*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !43, metadata !DIExpression()), !dbg !44
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !45, metadata !DIExpression()), !dbg !46
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %8, metadata !47, metadata !DIExpression()), !dbg !48
  %9 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !49
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %9, i32 0, i32 0, !dbg !50
  %11 = load %struct.fptr*, %struct.fptr** %10, align 8, !dbg !50
  ret %struct.fptr* %11, !dbg !51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.fptr* @clever(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !52 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fsptr*, align 8
  %8 = alloca %struct.fsptr*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !55, metadata !DIExpression()), !dbg !56
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !57, metadata !DIExpression()), !dbg !58
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %8, metadata !59, metadata !DIExpression()), !dbg !60
  %9 = load %struct.fsptr*, %struct.fsptr** %8, align 8, !dbg !61
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %9, i32 0, i32 0, !dbg !62
  %11 = load %struct.fptr*, %struct.fptr** %10, align 8, !dbg !62
  ret %struct.fptr* %11, !dbg !63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !64 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fptr, align 8
  %8 = alloca %struct.fptr, align 8
  %9 = alloca %struct.fsptr, align 8
  %10 = alloca %struct.fsptr, align 8
  %11 = alloca %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)*, align 8
  %12 = alloca %struct.fptr*, align 8
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %struct.fptr* %7, metadata !74, metadata !DIExpression()), !dbg !75
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %7, i32 0, i32 0, !dbg !76
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %13, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata %struct.fptr* %8, metadata !78, metadata !DIExpression()), !dbg !79
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %8, i32 0, i32 0, !dbg !80
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %14, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata %struct.fsptr* %9, metadata !82, metadata !DIExpression()), !dbg !83
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %9, i32 0, i32 0, !dbg !84
  store %struct.fptr* %7, %struct.fptr** %15, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata %struct.fsptr* %10, metadata !86, metadata !DIExpression()), !dbg !87
  %16 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %10, i32 0, i32 0, !dbg !88
  store %struct.fptr* %8, %struct.fptr** %16, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)** %11, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %struct.fptr** %12, metadata !93, metadata !DIExpression()), !dbg !94
  store %struct.fptr* null, %struct.fptr** %12, align 8, !dbg !94
  %17 = load i8, i8* %4, align 1, !dbg !95
  %18 = sext i8 %17 to i32, !dbg !95
  %19 = icmp eq i32 %18, 43, !dbg !97
  br i1 %19, label %20, label %21, !dbg !98

20:                                               ; preds = %3
  store %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* @foo, %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)** %11, align 8, !dbg !99
  br label %27, !dbg !101

21:                                               ; preds = %3
  %22 = load i8, i8* %4, align 1, !dbg !102
  %23 = sext i8 %22 to i32, !dbg !102
  %24 = icmp eq i32 %23, 45, !dbg !104
  br i1 %24, label %25, label %26, !dbg !105

25:                                               ; preds = %21
  store %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* @clever, %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)** %11, align 8, !dbg !106
  br label %26, !dbg !108

26:                                               ; preds = %25, %21
  br label %27

27:                                               ; preds = %26, %20
  %28 = load %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)*, %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)** %11, align 8, !dbg !109
  %29 = load i32, i32* %5, align 4, !dbg !110
  %30 = load i32, i32* %6, align 4, !dbg !111
  %31 = call %struct.fptr* %28(i32 %29, i32 %30, %struct.fsptr* %9, %struct.fsptr* %10), !dbg !109
  store %struct.fptr* %31, %struct.fptr** %12, align 8, !dbg !112
  %32 = load %struct.fptr*, %struct.fptr** %12, align 8, !dbg !113
  %33 = getelementptr inbounds %struct.fptr, %struct.fptr* %32, i32 0, i32 0, !dbg !114
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %33, align 8, !dbg !114
  %35 = load i32, i32* %5, align 4, !dbg !115
  %36 = load i32, i32* %6, align 4, !dbg !116
  %37 = call i32 %34(i32 %35, i32 %36), !dbg !113
  ret i32 0, !dbg !117
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test20.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign3-tests/test20.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !8, line: 10, type: !11)
!13 = !DILocation(line: 10, column: 14, scope: !7)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !8, line: 10, type: !11)
!15 = !DILocation(line: 10, column: 21, scope: !7)
!16 = !DILocation(line: 11, column: 11, scope: !7)
!17 = !DILocation(line: 11, column: 13, scope: !7)
!18 = !DILocation(line: 11, column: 12, scope: !7)
!19 = !DILocation(line: 11, column: 4, scope: !7)
!20 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !8, line: 14, type: !11)
!22 = !DILocation(line: 14, column: 15, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !8, line: 14, type: !11)
!24 = !DILocation(line: 14, column: 22, scope: !20)
!25 = !DILocation(line: 15, column: 11, scope: !20)
!26 = !DILocation(line: 15, column: 13, scope: !20)
!27 = !DILocation(line: 15, column: 12, scope: !20)
!28 = !DILocation(line: 15, column: 4, scope: !20)
!29 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 18, type: !30, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!32, !11, !11, !37, !37}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !8, line: 2, size: 64, elements: !34)
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !33, file: !8, line: 4, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !8, line: 6, size: 64, elements: !39)
!39 = !{!40}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !38, file: !8, line: 8, baseType: !32, size: 64)
!41 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 18, type: !11)
!42 = !DILocation(line: 18, column: 23, scope: !29)
!43 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 18, type: !11)
!44 = !DILocation(line: 18, column: 30, scope: !29)
!45 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !29, file: !8, line: 18, type: !37)
!46 = !DILocation(line: 18, column: 48, scope: !29)
!47 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !29, file: !8, line: 18, type: !37)
!48 = !DILocation(line: 18, column: 71, scope: !29)
!49 = !DILocation(line: 19, column: 11, scope: !29)
!50 = !DILocation(line: 19, column: 19, scope: !29)
!51 = !DILocation(line: 19, column: 4, scope: !29)
!52 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 22, type: !30, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "a", arg: 1, scope: !52, file: !8, line: 22, type: !11)
!54 = !DILocation(line: 22, column: 26, scope: !52)
!55 = !DILocalVariable(name: "b", arg: 2, scope: !52, file: !8, line: 22, type: !11)
!56 = !DILocation(line: 22, column: 33, scope: !52)
!57 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !52, file: !8, line: 22, type: !37)
!58 = !DILocation(line: 22, column: 51, scope: !52)
!59 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !52, file: !8, line: 22, type: !37)
!60 = !DILocation(line: 22, column: 74, scope: !52)
!61 = !DILocation(line: 23, column: 11, scope: !52)
!62 = !DILocation(line: 23, column: 19, scope: !52)
!63 = !DILocation(line: 23, column: 4, scope: !52)
!64 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 26, type: !65, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!11, !67, !11, !11}
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "x", arg: 1, scope: !64, file: !8, line: 26, type: !67)
!69 = !DILocation(line: 26, column: 14, scope: !64)
!70 = !DILocalVariable(name: "op1", arg: 2, scope: !64, file: !8, line: 26, type: !11)
!71 = !DILocation(line: 26, column: 21, scope: !64)
!72 = !DILocalVariable(name: "op2", arg: 3, scope: !64, file: !8, line: 26, type: !11)
!73 = !DILocation(line: 26, column: 30, scope: !64)
!74 = !DILocalVariable(name: "a_fptr", scope: !64, file: !8, line: 27, type: !33)
!75 = !DILocation(line: 27, column: 17, scope: !64)
!76 = !DILocation(line: 28, column: 12, scope: !64)
!77 = !DILocation(line: 28, column: 18, scope: !64)
!78 = !DILocalVariable(name: "s_fptr", scope: !64, file: !8, line: 29, type: !33)
!79 = !DILocation(line: 29, column: 17, scope: !64)
!80 = !DILocation(line: 30, column: 12, scope: !64)
!81 = !DILocation(line: 30, column: 18, scope: !64)
!82 = !DILocalVariable(name: "m_fptr", scope: !64, file: !8, line: 31, type: !38)
!83 = !DILocation(line: 31, column: 18, scope: !64)
!84 = !DILocation(line: 32, column: 12, scope: !64)
!85 = !DILocation(line: 32, column: 16, scope: !64)
!86 = !DILocalVariable(name: "n_fptr", scope: !64, file: !8, line: 33, type: !38)
!87 = !DILocation(line: 33, column: 18, scope: !64)
!88 = !DILocation(line: 34, column: 12, scope: !64)
!89 = !DILocation(line: 34, column: 16, scope: !64)
!90 = !DILocalVariable(name: "goo_ptr", scope: !64, file: !8, line: 36, type: !91)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!92 = !DILocation(line: 36, column: 20, scope: !64)
!93 = !DILocalVariable(name: "t_fptr", scope: !64, file: !8, line: 37, type: !32)
!94 = !DILocation(line: 37, column: 18, scope: !64)
!95 = !DILocation(line: 39, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !64, file: !8, line: 39, column: 9)
!97 = !DILocation(line: 39, column: 11, scope: !96)
!98 = !DILocation(line: 39, column: 9, scope: !64)
!99 = !DILocation(line: 40, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !8, line: 39, column: 19)
!101 = !DILocation(line: 41, column: 5, scope: !100)
!102 = !DILocation(line: 42, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !8, line: 42, column: 14)
!104 = !DILocation(line: 42, column: 16, scope: !103)
!105 = !DILocation(line: 42, column: 14, scope: !96)
!106 = !DILocation(line: 43, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !8, line: 42, column: 24)
!108 = !DILocation(line: 45, column: 5, scope: !107)
!109 = !DILocation(line: 47, column: 14, scope: !64)
!110 = !DILocation(line: 47, column: 22, scope: !64)
!111 = !DILocation(line: 47, column: 27, scope: !64)
!112 = !DILocation(line: 47, column: 12, scope: !64)
!113 = !DILocation(line: 48, column: 5, scope: !64)
!114 = !DILocation(line: 48, column: 13, scope: !64)
!115 = !DILocation(line: 48, column: 20, scope: !64)
!116 = !DILocation(line: 48, column: 25, scope: !64)
!117 = !DILocation(line: 50, column: 5, scope: !64)
