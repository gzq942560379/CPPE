; ModuleID = './assign3-tests/test22.c'
source_filename = "./assign3-tests/test22.c"
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
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !29 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !40, metadata !DIExpression()), !dbg !41
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !42
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !42
  %10 = load i32, i32* %5, align 4, !dbg !43
  %11 = load i32, i32* %6, align 4, !dbg !44
  %12 = call i32 %9(i32 %10, i32 %11), !dbg !45
  ret i32 %12, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @make_simple_alias(%struct.fptr* %0, %struct.fptr* %1) #0 !dbg !47 {
  %3 = alloca %struct.fptr*, align 8
  %4 = alloca %struct.fptr*, align 8
  store %struct.fptr* %0, %struct.fptr** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %3, metadata !51, metadata !DIExpression()), !dbg !52
  store %struct.fptr* %1, %struct.fptr** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %4, metadata !53, metadata !DIExpression()), !dbg !54
  %5 = load %struct.fptr*, %struct.fptr** %4, align 8, !dbg !55
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !56
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !56
  %8 = load %struct.fptr*, %struct.fptr** %3, align 8, !dbg !57
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %8, i32 0, i32 0, !dbg !58
  store i32 (i32, i32)* %7, i32 (i32, i32)** %9, align 8, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever() #0 !dbg !61 {
  %1 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %2 = alloca %struct.fptr, align 8
  %3 = alloca %struct.fptr, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %1, metadata !64, metadata !DIExpression()), !dbg !66
  store i32 (i32, i32, i32 (i32, i32)*)* null, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !67, metadata !DIExpression()), !dbg !68
  %5 = bitcast %struct.fptr* %2 to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 8 %5, i8 0, i64 8, i1 false), !dbg !68
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !69, metadata !DIExpression()), !dbg !70
  %6 = bitcast %struct.fptr* %3 to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 8 %6, i8 0, i64 8, i1 false), !dbg !70
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !71
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %7, align 8, !dbg !72
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !73
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !74
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !75
  call void @make_simple_alias(%struct.fptr* %2, %struct.fptr* %3), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %4, metadata !77, metadata !DIExpression()), !dbg !79
  %9 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !80
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !80
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !80
  %12 = call i32 %9(i32 1, i32 2, i32 (i32, i32)* %11), !dbg !80
  store i32 %12, i32* %4, align 4, !dbg !79
  ret i32 0, !dbg !81
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test22.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign3-tests/test22.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !8, line: 6, type: !11)
!13 = !DILocation(line: 6, column: 14, scope: !7)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !8, line: 6, type: !11)
!15 = !DILocation(line: 6, column: 21, scope: !7)
!16 = !DILocation(line: 7, column: 11, scope: !7)
!17 = !DILocation(line: 7, column: 13, scope: !7)
!18 = !DILocation(line: 7, column: 12, scope: !7)
!19 = !DILocation(line: 7, column: 4, scope: !7)
!20 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 10, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !8, line: 10, type: !11)
!22 = !DILocation(line: 10, column: 15, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !8, line: 10, type: !11)
!24 = !DILocation(line: 10, column: 21, scope: !20)
!25 = !DILocation(line: 12, column: 12, scope: !20)
!26 = !DILocation(line: 12, column: 14, scope: !20)
!27 = !DILocation(line: 12, column: 13, scope: !20)
!28 = !DILocation(line: 12, column: 5, scope: !20)
!29 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 15, type: !30, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11, !11, !11, !32}
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !8, line: 2, size: 64, elements: !33)
!33 = !{!34}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !32, file: !8, line: 4, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!36 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 15, type: !11)
!37 = !DILocation(line: 15, column: 13, scope: !29)
!38 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 15, type: !11)
!39 = !DILocation(line: 15, column: 19, scope: !29)
!40 = !DILocalVariable(name: "af_ptr", arg: 3, scope: !29, file: !8, line: 15, type: !32)
!41 = !DILocation(line: 15, column: 33, scope: !29)
!42 = !DILocation(line: 17, column: 19, scope: !29)
!43 = !DILocation(line: 17, column: 26, scope: !29)
!44 = !DILocation(line: 17, column: 28, scope: !29)
!45 = !DILocation(line: 17, column: 12, scope: !29)
!46 = !DILocation(line: 17, column: 5, scope: !29)
!47 = distinct !DISubprogram(name: "make_simple_alias", scope: !8, file: !8, line: 19, type: !48, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!51 = !DILocalVariable(name: "a", arg: 1, scope: !47, file: !8, line: 19, type: !50)
!52 = !DILocation(line: 19, column: 37, scope: !47)
!53 = !DILocalVariable(name: "b", arg: 2, scope: !47, file: !8, line: 19, type: !50)
!54 = !DILocation(line: 19, column: 53, scope: !47)
!55 = !DILocation(line: 21, column: 15, scope: !47)
!56 = !DILocation(line: 21, column: 18, scope: !47)
!57 = !DILocation(line: 21, column: 5, scope: !47)
!58 = !DILocation(line: 21, column: 8, scope: !47)
!59 = !DILocation(line: 21, column: 14, scope: !47)
!60 = !DILocation(line: 22, column: 1, scope: !47)
!61 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 23, type: !62, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!11}
!64 = !DILocalVariable(name: "af_ptr", scope: !61, file: !8, line: 25, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!66 = !DILocation(line: 25, column: 11, scope: !61)
!67 = !DILocalVariable(name: "tf_ptr", scope: !61, file: !8, line: 26, type: !32)
!68 = !DILocation(line: 26, column: 17, scope: !61)
!69 = !DILocalVariable(name: "sf_ptr", scope: !61, file: !8, line: 27, type: !32)
!70 = !DILocation(line: 27, column: 17, scope: !61)
!71 = !DILocation(line: 28, column: 12, scope: !61)
!72 = !DILocation(line: 28, column: 18, scope: !61)
!73 = !DILocation(line: 29, column: 12, scope: !61)
!74 = !DILocation(line: 29, column: 18, scope: !61)
!75 = !DILocation(line: 30, column: 11, scope: !61)
!76 = !DILocation(line: 31, column: 5, scope: !61)
!77 = !DILocalVariable(name: "result", scope: !61, file: !8, line: 32, type: !78)
!78 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!79 = !DILocation(line: 32, column: 14, scope: !61)
!80 = !DILocation(line: 32, column: 23, scope: !61)
!81 = !DILocation(line: 33, column: 5, scope: !61)
