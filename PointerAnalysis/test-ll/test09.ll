; ModuleID = './assign3-tests/test09.c'
source_filename = "./assign3-tests/test09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !21 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  %5 = load i32, i32* %3, align 4, !dbg !26
  %6 = load i32, i32* %4, align 4, !dbg !27
  %7 = add nsw i32 %5, %6, !dbg !28
  ret i32 %7, !dbg !29
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !30 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !34
  %5 = load i32, i32* %3, align 4, !dbg !35
  %6 = load i32, i32* %4, align 4, !dbg !36
  %7 = sub nsw i32 %5, %6, !dbg !37
  ret i32 %7, !dbg !38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32 %0) #0 !dbg !39 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fsptr, align 8
  %5 = alloca %struct.fsptr*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata %struct.fsptr* %4, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct.fsptr** %5, metadata !48, metadata !DIExpression()), !dbg !49
  %6 = call noalias i8* @malloc(i64 8) #4, !dbg !50
  %7 = bitcast i8* %6 to %struct.fsptr*, !dbg !51
  store %struct.fsptr* %7, %struct.fsptr** %5, align 8, !dbg !49
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !52
  store %struct.fptr* %3, %struct.fptr** %8, align 8, !dbg !53
  %9 = load %struct.fsptr*, %struct.fsptr** %5, align 8, !dbg !54
  %10 = bitcast %struct.fsptr* %9 to i8*, !dbg !55
  %11 = bitcast %struct.fsptr* %4 to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %10, i8* align 8 %11, i64 8, i1 false), !dbg !55
  %12 = load i32, i32* %2, align 4, !dbg !56
  %13 = icmp sgt i32 %12, 1, !dbg !58
  br i1 %13, label %14, label %23, !dbg !59

14:                                               ; preds = %1
  %15 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !60
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %15, align 8, !dbg !62
  %16 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !63
  %17 = load %struct.fptr*, %struct.fptr** %16, align 8, !dbg !63
  %18 = getelementptr inbounds %struct.fptr, %struct.fptr* %17, i32 0, i32 0, !dbg !64
  %19 = load i32 (i32, i32)*, i32 (i32, i32)** %18, align 8, !dbg !64
  %20 = load i32, i32* %2, align 4, !dbg !65
  %21 = call i32 %19(i32 1, i32 %20), !dbg !66
  store i32 %21, i32* %2, align 4, !dbg !67
  %22 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !68
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %22, align 8, !dbg !69
  br label %28, !dbg !70

23:                                               ; preds = %1
  %24 = load %struct.fsptr*, %struct.fsptr** %5, align 8, !dbg !71
  %25 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %24, i32 0, i32 0, !dbg !73
  %26 = load %struct.fptr*, %struct.fptr** %25, align 8, !dbg !73
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %26, i32 0, i32 0, !dbg !74
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %27, align 8, !dbg !75
  br label %28

28:                                               ; preds = %23, %14
  %29 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !76
  %30 = load i32 (i32, i32)*, i32 (i32, i32)** %29, align 8, !dbg !76
  %31 = load i32, i32* %2, align 4, !dbg !77
  %32 = call i32 %30(i32 1, i32 %31), !dbg !78
  store i32 %32, i32* %2, align 4, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test09.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !6, line: 6, size: 64, elements: !7)
!6 = !DIFile(filename: "./assign3-tests/test09.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !5, file: !6, line: 8, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !6, line: 2, size: 64, elements: !11)
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !10, file: !6, line: 4, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DISubroutineType(types: !15)
!15 = !{!16, !16, !16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.0 "}
!21 = distinct !DISubprogram(name: "plus", scope: !6, file: !6, line: 10, type: !14, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DILocalVariable(name: "a", arg: 1, scope: !21, file: !6, line: 10, type: !16)
!23 = !DILocation(line: 10, column: 14, scope: !21)
!24 = !DILocalVariable(name: "b", arg: 2, scope: !21, file: !6, line: 10, type: !16)
!25 = !DILocation(line: 10, column: 21, scope: !21)
!26 = !DILocation(line: 11, column: 11, scope: !21)
!27 = !DILocation(line: 11, column: 13, scope: !21)
!28 = !DILocation(line: 11, column: 12, scope: !21)
!29 = !DILocation(line: 11, column: 4, scope: !21)
!30 = distinct !DISubprogram(name: "minus", scope: !6, file: !6, line: 14, type: !14, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "a", arg: 1, scope: !30, file: !6, line: 14, type: !16)
!32 = !DILocation(line: 14, column: 15, scope: !30)
!33 = !DILocalVariable(name: "b", arg: 2, scope: !30, file: !6, line: 14, type: !16)
!34 = !DILocation(line: 14, column: 22, scope: !30)
!35 = !DILocation(line: 15, column: 11, scope: !30)
!36 = !DILocation(line: 15, column: 13, scope: !30)
!37 = !DILocation(line: 15, column: 12, scope: !30)
!38 = !DILocation(line: 15, column: 4, scope: !30)
!39 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 17, type: !40, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !16}
!42 = !DILocalVariable(name: "x", arg: 1, scope: !39, file: !6, line: 17, type: !16)
!43 = !DILocation(line: 17, column: 14, scope: !39)
!44 = !DILocalVariable(name: "a_fptr", scope: !39, file: !6, line: 19, type: !10)
!45 = !DILocation(line: 19, column: 14, scope: !39)
!46 = !DILocalVariable(name: "s_fptr", scope: !39, file: !6, line: 20, type: !5)
!47 = !DILocation(line: 20, column: 15, scope: !39)
!48 = !DILocalVariable(name: "w_fptr", scope: !39, file: !6, line: 21, type: !4)
!49 = !DILocation(line: 21, column: 16, scope: !39)
!50 = !DILocation(line: 21, column: 38, scope: !39)
!51 = !DILocation(line: 21, column: 23, scope: !39)
!52 = !DILocation(line: 22, column: 9, scope: !39)
!53 = !DILocation(line: 22, column: 13, scope: !39)
!54 = !DILocation(line: 23, column: 3, scope: !39)
!55 = !DILocation(line: 23, column: 10, scope: !39)
!56 = !DILocation(line: 24, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !39, file: !6, line: 24, column: 5)
!58 = !DILocation(line: 24, column: 6, scope: !57)
!59 = !DILocation(line: 24, column: 5, scope: !39)
!60 = !DILocation(line: 26, column: 11, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !6, line: 25, column: 2)
!62 = !DILocation(line: 26, column: 17, scope: !61)
!63 = !DILocation(line: 27, column: 13, scope: !61)
!64 = !DILocation(line: 27, column: 19, scope: !61)
!65 = !DILocation(line: 27, column: 28, scope: !61)
!66 = !DILocation(line: 27, column: 6, scope: !61)
!67 = !DILocation(line: 27, column: 5, scope: !61)
!68 = !DILocation(line: 28, column: 11, scope: !61)
!69 = !DILocation(line: 28, column: 17, scope: !61)
!70 = !DILocation(line: 29, column: 2, scope: !61)
!71 = !DILocation(line: 31, column: 3, scope: !72)
!72 = distinct !DILexicalBlock(scope: !57, file: !6, line: 30, column: 2)
!73 = !DILocation(line: 31, column: 11, scope: !72)
!74 = !DILocation(line: 31, column: 17, scope: !72)
!75 = !DILocation(line: 31, column: 23, scope: !72)
!76 = !DILocation(line: 33, column: 11, scope: !39)
!77 = !DILocation(line: 33, column: 20, scope: !39)
!78 = !DILocation(line: 33, column: 4, scope: !39)
!79 = !DILocation(line: 33, column: 3, scope: !39)
!80 = !DILocation(line: 34, column: 1, scope: !39)
