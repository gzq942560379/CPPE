; ModuleID = './assign3-tests/test02.c'
source_filename = "./assign3-tests/test02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

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
  %5 = alloca %struct.fptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !41, metadata !DIExpression()), !dbg !45
  %9 = bitcast %struct.fptr* %5 to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 8 %9, i8 0, i64 8, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %6, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 1, i32* %6, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %7, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 2, i32* %7, align 4, !dbg !49
  %10 = load i32, i32* %2, align 4, !dbg !50
  %11 = icmp eq i32 %10, 3, !dbg !52
  br i1 %11, label %12, label %15, !dbg !53

12:                                               ; preds = %1
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !54
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !56
  store i32 (i32, i32)* %13, i32 (i32, i32)** %14, align 8, !dbg !57
  br label %18, !dbg !58

15:                                               ; preds = %1
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !59
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !61
  store i32 (i32, i32)* %16, i32 (i32, i32)** %17, align 8, !dbg !62
  br label %18

18:                                               ; preds = %15, %12
  %19 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !63
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %19, align 8, !dbg !63
  %21 = icmp ne i32 (i32, i32)* %20, null, !dbg !65
  br i1 %21, label %22, label %28, !dbg !66

22:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata i32* %8, metadata !67, metadata !DIExpression()), !dbg !70
  %23 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !71
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %23, align 8, !dbg !71
  %25 = load i32, i32* %6, align 4, !dbg !72
  %26 = load i32, i32* %7, align 4, !dbg !73
  %27 = call i32 %24(i32 %25, i32 %26), !dbg !74
  store i32 %27, i32* %8, align 4, !dbg !70
  br label %28, !dbg !75

28:                                               ; preds = %22, %18
  ret i32 0, !dbg !76
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test02.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "plus", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./assign3-tests/test02.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 14, scope: !9)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !10, line: 6, type: !13)
!17 = !DILocation(line: 6, column: 21, scope: !9)
!18 = !DILocation(line: 7, column: 11, scope: !9)
!19 = !DILocation(line: 7, column: 13, scope: !9)
!20 = !DILocation(line: 7, column: 12, scope: !9)
!21 = !DILocation(line: 7, column: 4, scope: !9)
!22 = distinct !DISubprogram(name: "minus", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !10, line: 10, type: !13)
!24 = !DILocation(line: 10, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !10, line: 10, type: !13)
!26 = !DILocation(line: 10, column: 22, scope: !22)
!27 = !DILocation(line: 11, column: 11, scope: !22)
!28 = !DILocation(line: 11, column: 13, scope: !22)
!29 = !DILocation(line: 11, column: 12, scope: !22)
!30 = !DILocation(line: 11, column: 4, scope: !22)
!31 = distinct !DISubprogram(name: "clever", scope: !10, file: !10, line: 14, type: !32, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!13, !13}
!34 = !DILocalVariable(name: "x", arg: 1, scope: !31, file: !10, line: 14, type: !13)
!35 = !DILocation(line: 14, column: 16, scope: !31)
!36 = !DILocalVariable(name: "a_fptr", scope: !31, file: !10, line: 15, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!38 = !DILocation(line: 15, column: 11, scope: !31)
!39 = !DILocalVariable(name: "s_fptr", scope: !31, file: !10, line: 16, type: !37)
!40 = !DILocation(line: 16, column: 11, scope: !31)
!41 = !DILocalVariable(name: "t_fptr", scope: !31, file: !10, line: 17, type: !42)
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !10, line: 2, size: 64, elements: !43)
!43 = !{!44}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !42, file: !10, line: 4, baseType: !37, size: 64)
!45 = !DILocation(line: 17, column: 17, scope: !31)
!46 = !DILocalVariable(name: "op1", scope: !31, file: !10, line: 19, type: !13)
!47 = !DILocation(line: 19, column: 9, scope: !31)
!48 = !DILocalVariable(name: "op2", scope: !31, file: !10, line: 19, type: !13)
!49 = !DILocation(line: 19, column: 16, scope: !31)
!50 = !DILocation(line: 21, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !31, file: !10, line: 21, column: 9)
!52 = !DILocation(line: 21, column: 11, scope: !51)
!53 = !DILocation(line: 21, column: 9, scope: !31)
!54 = !DILocation(line: 22, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 21, column: 17)
!56 = !DILocation(line: 22, column: 15, scope: !55)
!57 = !DILocation(line: 22, column: 22, scope: !55)
!58 = !DILocation(line: 23, column: 5, scope: !55)
!59 = !DILocation(line: 24, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !10, line: 23, column: 12)
!61 = !DILocation(line: 24, column: 15, scope: !60)
!62 = !DILocation(line: 24, column: 22, scope: !60)
!63 = !DILocation(line: 27, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !31, file: !10, line: 27, column: 9)
!65 = !DILocation(line: 27, column: 23, scope: !64)
!66 = !DILocation(line: 27, column: 9, scope: !31)
!67 = !DILocalVariable(name: "result", scope: !68, file: !10, line: 28, type: !69)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 27, column: 32)
!69 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!70 = !DILocation(line: 28, column: 17, scope: !68)
!71 = !DILocation(line: 28, column: 33, scope: !68)
!72 = !DILocation(line: 28, column: 40, scope: !68)
!73 = !DILocation(line: 28, column: 45, scope: !68)
!74 = !DILocation(line: 28, column: 26, scope: !68)
!75 = !DILocation(line: 29, column: 5, scope: !68)
!76 = !DILocation(line: 30, column: 4, scope: !31)
