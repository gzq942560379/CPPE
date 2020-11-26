; ModuleID = './assign3-tests/test08.c'
source_filename = "./assign3-tests/test08.c"
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
define dso_local void @foo(i32 %0) #0 !dbg !29 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fsptr, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !34, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.fsptr* %4, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !46
  store %struct.fptr* %3, %struct.fptr** %5, align 8, !dbg !47
  %6 = load i32, i32* %2, align 4, !dbg !48
  %7 = icmp sgt i32 %6, 1, !dbg !50
  br i1 %7, label %8, label %17, !dbg !51

8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !52
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %9, align 8, !dbg !54
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !55
  %11 = load %struct.fptr*, %struct.fptr** %10, align 8, !dbg !55
  %12 = getelementptr inbounds %struct.fptr, %struct.fptr* %11, i32 0, i32 0, !dbg !56
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %12, align 8, !dbg !56
  %14 = load i32, i32* %2, align 4, !dbg !57
  %15 = call i32 %13(i32 1, i32 %14), !dbg !58
  store i32 %15, i32* %2, align 4, !dbg !59
  %16 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !60
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %16, align 8, !dbg !61
  br label %21, !dbg !62

17:                                               ; preds = %1
  %18 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !63
  %19 = load %struct.fptr*, %struct.fptr** %18, align 8, !dbg !63
  %20 = getelementptr inbounds %struct.fptr, %struct.fptr* %19, i32 0, i32 0, !dbg !65
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %20, align 8, !dbg !66
  br label %21

21:                                               ; preds = %17, %8
  %22 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !67
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %22, align 8, !dbg !67
  %24 = load i32, i32* %2, align 4, !dbg !68
  %25 = call i32 %23(i32 1, i32 %24), !dbg !69
  store i32 %25, i32* %2, align 4, !dbg !70
  ret void, !dbg !71
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test08.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign3-tests/test08.c", directory: "/home/gzq/CPPE/PointerAnalysis")
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
!29 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 17, type: !30, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !11}
!32 = !DILocalVariable(name: "x", arg: 1, scope: !29, file: !8, line: 17, type: !11)
!33 = !DILocation(line: 17, column: 14, scope: !29)
!34 = !DILocalVariable(name: "a_fptr", scope: !29, file: !8, line: 19, type: !35)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !8, line: 2, size: 64, elements: !36)
!36 = !{!37}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !35, file: !8, line: 4, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!39 = !DILocation(line: 19, column: 14, scope: !29)
!40 = !DILocalVariable(name: "s_fptr", scope: !29, file: !8, line: 20, type: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !8, line: 6, size: 64, elements: !42)
!42 = !{!43}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !41, file: !8, line: 8, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!45 = !DILocation(line: 20, column: 15, scope: !29)
!46 = !DILocation(line: 21, column: 9, scope: !29)
!47 = !DILocation(line: 21, column: 13, scope: !29)
!48 = !DILocation(line: 22, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !29, file: !8, line: 22, column: 5)
!50 = !DILocation(line: 22, column: 6, scope: !49)
!51 = !DILocation(line: 22, column: 5, scope: !29)
!52 = !DILocation(line: 24, column: 11, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !8, line: 23, column: 2)
!54 = !DILocation(line: 24, column: 17, scope: !53)
!55 = !DILocation(line: 25, column: 13, scope: !53)
!56 = !DILocation(line: 25, column: 19, scope: !53)
!57 = !DILocation(line: 25, column: 28, scope: !53)
!58 = !DILocation(line: 25, column: 6, scope: !53)
!59 = !DILocation(line: 25, column: 5, scope: !53)
!60 = !DILocation(line: 26, column: 11, scope: !53)
!61 = !DILocation(line: 26, column: 17, scope: !53)
!62 = !DILocation(line: 27, column: 2, scope: !53)
!63 = !DILocation(line: 29, column: 10, scope: !64)
!64 = distinct !DILexicalBlock(scope: !49, file: !8, line: 28, column: 2)
!65 = !DILocation(line: 29, column: 16, scope: !64)
!66 = !DILocation(line: 29, column: 22, scope: !64)
!67 = !DILocation(line: 31, column: 11, scope: !29)
!68 = !DILocation(line: 31, column: 20, scope: !29)
!69 = !DILocation(line: 31, column: 4, scope: !29)
!70 = !DILocation(line: 31, column: 3, scope: !29)
!71 = !DILocation(line: 32, column: 1, scope: !29)
