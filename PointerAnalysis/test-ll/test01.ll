; ModuleID = './assign3-tests/test01.c'
source_filename = "./assign3-tests/test01.c"
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
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %5, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %5, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %6, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 1, i32* %6, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %7, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 2, i32* %7, align 4, !dbg !46
  %9 = load i32, i32* %2, align 4, !dbg !47
  %10 = icmp eq i32 %9, 3, !dbg !49
  br i1 %10, label %11, label %13, !dbg !50

11:                                               ; preds = %1
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !51
  store i32 (i32, i32)* %12, i32 (i32, i32)** %5, align 8, !dbg !53
  br label %13, !dbg !54

13:                                               ; preds = %11, %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !55
  %15 = icmp ne i32 (i32, i32)* %14, null, !dbg !57
  br i1 %15, label %16, label %21, !dbg !58

16:                                               ; preds = %13
  call void @llvm.dbg.declare(metadata i32* %8, metadata !59, metadata !DIExpression()), !dbg !62
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !63
  %18 = load i32, i32* %6, align 4, !dbg !64
  %19 = load i32, i32* %7, align 4, !dbg !65
  %20 = call i32 %17(i32 %18, i32 %19), !dbg !63
  store i32 %20, i32* %8, align 4, !dbg !62
  br label %21, !dbg !66

21:                                               ; preds = %16, %13
  ret i32 0, !dbg !67
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test01.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "plus", scope: !10, file: !10, line: 2, type: !11, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./assign3-tests/test01.c", directory: "/home/gzq/CPPE/PointerAnalysis")
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
!43 = !DILocalVariable(name: "op1", scope: !31, file: !10, line: 15, type: !13)
!44 = !DILocation(line: 15, column: 9, scope: !31)
!45 = !DILocalVariable(name: "op2", scope: !31, file: !10, line: 15, type: !13)
!46 = !DILocation(line: 15, column: 16, scope: !31)
!47 = !DILocation(line: 17, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !31, file: !10, line: 17, column: 9)
!49 = !DILocation(line: 17, column: 11, scope: !48)
!50 = !DILocation(line: 17, column: 9, scope: !31)
!51 = !DILocation(line: 18, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 17, column: 17)
!53 = !DILocation(line: 18, column: 15, scope: !52)
!54 = !DILocation(line: 19, column: 5, scope: !52)
!55 = !DILocation(line: 21, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !31, file: !10, line: 21, column: 9)
!57 = !DILocation(line: 21, column: 16, scope: !56)
!58 = !DILocation(line: 21, column: 9, scope: !31)
!59 = !DILocalVariable(name: "result", scope: !60, file: !10, line: 22, type: !61)
!60 = distinct !DILexicalBlock(scope: !56, file: !10, line: 21, column: 25)
!61 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 22, column: 17, scope: !60)
!63 = !DILocation(line: 22, column: 26, scope: !60)
!64 = !DILocation(line: 22, column: 33, scope: !60)
!65 = !DILocation(line: 22, column: 38, scope: !60)
!66 = !DILocation(line: 23, column: 5, scope: !60)
!67 = !DILocation(line: 24, column: 4, scope: !31)
