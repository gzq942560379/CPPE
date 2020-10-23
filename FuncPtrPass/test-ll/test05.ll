; ModuleID = './assign2-tests/test05.c'
source_filename = "./assign2-tests/test05.c"
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
  %5 = alloca i32 (i32, i32)*, align 8
  %6 = alloca i32 (i32, i32)*, align 8
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %5, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 (i32, i32)* null, i32 (i32, i32)** %5, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 (i32, i32)* null, i32 (i32, i32)** %6, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 (i32, i32)* null, i32 (i32, i32)** %7, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %8, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 1, i32* %8, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %9, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 2, i32* %9, align 4, !dbg !50
  %11 = load i32, i32* %2, align 4, !dbg !51
  %12 = icmp sge i32 %11, 3, !dbg !53
  br i1 %12, label %13, label %15, !dbg !54

13:                                               ; preds = %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !55
  store i32 (i32, i32)* %14, i32 (i32, i32)** %5, align 8, !dbg !57
  br label %15, !dbg !58

15:                                               ; preds = %13, %1
  %16 = load i32, i32* %2, align 4, !dbg !59
  %17 = icmp sge i32 %16, 4, !dbg !61
  br i1 %17, label %18, label %20, !dbg !62

18:                                               ; preds = %15
  %19 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !63
  store i32 (i32, i32)* %19, i32 (i32, i32)** %5, align 8, !dbg !65
  br label %20, !dbg !66

20:                                               ; preds = %18, %15
  %21 = load i32, i32* %2, align 4, !dbg !67
  %22 = icmp sge i32 %21, 5, !dbg !69
  br i1 %22, label %23, label %25, !dbg !70

23:                                               ; preds = %20
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !71
  store i32 (i32, i32)* %24, i32 (i32, i32)** %6, align 8, !dbg !73
  br label %25, !dbg !74

25:                                               ; preds = %23, %20
  %26 = load i32, i32* %2, align 4, !dbg !75
  %27 = icmp sge i32 %26, 6, !dbg !77
  br i1 %27, label %28, label %30, !dbg !78

28:                                               ; preds = %25
  %29 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !79
  store i32 (i32, i32)* %29, i32 (i32, i32)** %7, align 8, !dbg !80
  br label %30, !dbg !81

30:                                               ; preds = %28, %25
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !82
  %32 = icmp ne i32 (i32, i32)* %31, null, !dbg !84
  br i1 %32, label %33, label %38, !dbg !85

33:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata i32* %10, metadata !86, metadata !DIExpression()), !dbg !89
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !90
  %35 = load i32, i32* %8, align 4, !dbg !91
  %36 = load i32, i32* %9, align 4, !dbg !92
  %37 = call i32 %34(i32 %35, i32 %36), !dbg !90
  store i32 %37, i32* %10, align 4, !dbg !89
  br label %38, !dbg !93

38:                                               ; preds = %33, %30
  ret i32 0, !dbg !94
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test05.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "plus", scope: !10, file: !10, line: 2, type: !11, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./assign2-tests/test05.c", directory: "/home/gzq/CPPE/FuncPtrPass")
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
!41 = !DILocalVariable(name: "t_fptr", scope: !31, file: !10, line: 13, type: !37)
!42 = !DILocation(line: 13, column: 11, scope: !31)
!43 = !DILocalVariable(name: "q_fptr", scope: !31, file: !10, line: 14, type: !37)
!44 = !DILocation(line: 14, column: 11, scope: !31)
!45 = !DILocalVariable(name: "r_fptr", scope: !31, file: !10, line: 15, type: !37)
!46 = !DILocation(line: 15, column: 11, scope: !31)
!47 = !DILocalVariable(name: "op1", scope: !31, file: !10, line: 17, type: !13)
!48 = !DILocation(line: 17, column: 9, scope: !31)
!49 = !DILocalVariable(name: "op2", scope: !31, file: !10, line: 17, type: !13)
!50 = !DILocation(line: 17, column: 16, scope: !31)
!51 = !DILocation(line: 19, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !31, file: !10, line: 19, column: 9)
!53 = !DILocation(line: 19, column: 11, scope: !52)
!54 = !DILocation(line: 19, column: 9, scope: !31)
!55 = !DILocation(line: 20, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 19, column: 17)
!57 = !DILocation(line: 20, column: 15, scope: !56)
!58 = !DILocation(line: 21, column: 5, scope: !56)
!59 = !DILocation(line: 22, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !31, file: !10, line: 22, column: 9)
!61 = !DILocation(line: 22, column: 11, scope: !60)
!62 = !DILocation(line: 22, column: 9, scope: !31)
!63 = !DILocation(line: 23, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 22, column: 17)
!65 = !DILocation(line: 23, column: 15, scope: !64)
!66 = !DILocation(line: 24, column: 5, scope: !64)
!67 = !DILocation(line: 25, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !31, file: !10, line: 25, column: 9)
!69 = !DILocation(line: 25, column: 11, scope: !68)
!70 = !DILocation(line: 25, column: 9, scope: !31)
!71 = !DILocation(line: 26, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 25, column: 17)
!73 = !DILocation(line: 26, column: 15, scope: !72)
!74 = !DILocation(line: 27, column: 5, scope: !72)
!75 = !DILocation(line: 28, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !31, file: !10, line: 28, column: 9)
!77 = !DILocation(line: 28, column: 11, scope: !76)
!78 = !DILocation(line: 28, column: 9, scope: !31)
!79 = !DILocation(line: 29, column: 17, scope: !76)
!80 = !DILocation(line: 29, column: 15, scope: !76)
!81 = !DILocation(line: 29, column: 8, scope: !76)
!82 = !DILocation(line: 32, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !31, file: !10, line: 32, column: 9)
!84 = !DILocation(line: 32, column: 16, scope: !83)
!85 = !DILocation(line: 32, column: 9, scope: !31)
!86 = !DILocalVariable(name: "result", scope: !87, file: !10, line: 33, type: !88)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 32, column: 25)
!88 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!89 = !DILocation(line: 33, column: 17, scope: !87)
!90 = !DILocation(line: 33, column: 26, scope: !87)
!91 = !DILocation(line: 33, column: 33, scope: !87)
!92 = !DILocation(line: 33, column: 38, scope: !87)
!93 = !DILocation(line: 34, column: 5, scope: !87)
!94 = !DILocation(line: 35, column: 4, scope: !31)
