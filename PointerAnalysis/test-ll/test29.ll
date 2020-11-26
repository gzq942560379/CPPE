; ModuleID = './assign3-tests/test29.c'
source_filename = "./assign3-tests/test29.c"
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
define dso_local i32 @clever(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !39 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fptr*, align 8
  %8 = alloca %struct.fptr*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !44, metadata !DIExpression()), !dbg !45
  store %struct.fptr* %2, %struct.fptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %7, metadata !46, metadata !DIExpression()), !dbg !47
  store %struct.fptr* %3, %struct.fptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %8, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !50, metadata !DIExpression()), !dbg !51
  %10 = load %struct.fptr*, %struct.fptr** %7, align 8, !dbg !52
  %11 = getelementptr inbounds %struct.fptr, %struct.fptr* %10, i32 0, i32 0, !dbg !53
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %11, align 8, !dbg !53
  store i32 (i32, i32)* %12, i32 (i32, i32)** %9, align 8, !dbg !51
  %13 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !54
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %13, i32 0, i32 0, !dbg !55
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %14, align 8, !dbg !55
  %16 = load %struct.fptr*, %struct.fptr** %7, align 8, !dbg !56
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !57
  store i32 (i32, i32)* %15, i32 (i32, i32)** %17, align 8, !dbg !58
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !59
  %19 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !60
  %20 = getelementptr inbounds %struct.fptr, %struct.fptr* %19, i32 0, i32 0, !dbg !61
  store i32 (i32, i32)* %18, i32 (i32, i32)** %20, align 8, !dbg !62
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !63
  %22 = load i32, i32* %5, align 4, !dbg !64
  %23 = load i32, i32* %6, align 4, !dbg !65
  %24 = call i32 %21(i32 %22, i32 %23), !dbg !63
  ret i32 %24, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !67 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fsptr*, align 8
  %8 = alloca %struct.fsptr*, align 8
  %9 = alloca %struct.fptr, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !72, metadata !DIExpression()), !dbg !73
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !74, metadata !DIExpression()), !dbg !75
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %8, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %struct.fptr* %9, metadata !78, metadata !DIExpression()), !dbg !79
  %10 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !80
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %10, i32 0, i32 0, !dbg !81
  %12 = load %struct.fptr*, %struct.fptr** %11, align 8, !dbg !81
  %13 = bitcast %struct.fptr* %9 to i8*, !dbg !82
  %14 = bitcast %struct.fptr* %12 to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 8, i1 false), !dbg !82
  %15 = load %struct.fsptr*, %struct.fsptr** %8, align 8, !dbg !83
  %16 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %15, i32 0, i32 0, !dbg !84
  %17 = load %struct.fptr*, %struct.fptr** %16, align 8, !dbg !84
  %18 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !85
  %19 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %18, i32 0, i32 0, !dbg !86
  store %struct.fptr* %17, %struct.fptr** %19, align 8, !dbg !87
  %20 = load i32, i32* %5, align 4, !dbg !88
  %21 = load i32, i32* %6, align 4, !dbg !89
  %22 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !90
  %23 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %22, i32 0, i32 0, !dbg !91
  %24 = load %struct.fptr*, %struct.fptr** %23, align 8, !dbg !91
  %25 = call i32 @clever(i32 %20, i32 %21, %struct.fptr* %24, %struct.fptr* %9), !dbg !92
  %26 = getelementptr inbounds %struct.fptr, %struct.fptr* %9, i32 0, i32 0, !dbg !93
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %26, align 8, !dbg !93
  %28 = load i32, i32* %5, align 4, !dbg !94
  %29 = load i32, i32* %6, align 4, !dbg !95
  %30 = call i32 %27(i32 %28, i32 %29), !dbg !96
  ret i32 %30, !dbg !97
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @moo(i32 %0) #0 !dbg !98 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fsptr, align 8
  %6 = alloca %struct.fsptr, align 8
  %7 = alloca %struct.fsptr*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !103, metadata !DIExpression()), !dbg !104
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !105
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !107, metadata !DIExpression()), !dbg !108
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !109
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %9, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata %struct.fsptr* %5, metadata !111, metadata !DIExpression()), !dbg !112
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %5, i32 0, i32 0, !dbg !113
  store %struct.fptr* %3, %struct.fptr** %10, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata %struct.fsptr* %6, metadata !115, metadata !DIExpression()), !dbg !116
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !117
  store %struct.fptr* %4, %struct.fptr** %11, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !119, metadata !DIExpression()), !dbg !120
  %12 = call noalias i8* @malloc(i64 8) #4, !dbg !121
  %13 = bitcast i8* %12 to %struct.fsptr*, !dbg !122
  store %struct.fsptr* %13, %struct.fsptr** %7, align 8, !dbg !120
  %14 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !123
  %15 = bitcast %struct.fsptr* %14 to i8*, !dbg !124
  %16 = bitcast %struct.fsptr* %5 to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 8, i1 false), !dbg !124
  %17 = load i32, i32* %2, align 4, !dbg !125
  %18 = icmp sgt i32 %17, 1, !dbg !127
  br i1 %18, label %19, label %23, !dbg !128

19:                                               ; preds = %1
  %20 = load i32, i32* %2, align 4, !dbg !129
  %21 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !131
  %22 = call i32 @foo(i32 1, i32 %20, %struct.fsptr* %21, %struct.fsptr* %6), !dbg !132
  br label %28, !dbg !133

23:                                               ; preds = %1
  %24 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !134
  %25 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %24, i32 0, i32 0, !dbg !136
  %26 = load %struct.fptr*, %struct.fptr** %25, align 8, !dbg !136
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %26, i32 0, i32 0, !dbg !137
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %27, align 8, !dbg !138
  br label %28

28:                                               ; preds = %23, %19
  %29 = load i32, i32* %2, align 4, !dbg !139
  %30 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !140
  %31 = call i32 @foo(i32 1, i32 %29, %struct.fsptr* %30, %struct.fsptr* %5), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test29.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !6, line: 6, size: 64, elements: !7)
!6 = !DIFile(filename: "./assign3-tests/test29.c", directory: "/home/gzq/CPPE/PointerAnalysis")
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
!39 = distinct !DISubprogram(name: "clever", scope: !6, file: !6, line: 17, type: !40, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!16, !16, !16, !9, !9}
!42 = !DILocalVariable(name: "a", arg: 1, scope: !39, file: !6, line: 17, type: !16)
!43 = !DILocation(line: 17, column: 16, scope: !39)
!44 = !DILocalVariable(name: "b", arg: 2, scope: !39, file: !6, line: 17, type: !16)
!45 = !DILocation(line: 17, column: 23, scope: !39)
!46 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !39, file: !6, line: 17, type: !9)
!47 = !DILocation(line: 17, column: 40, scope: !39)
!48 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !39, file: !6, line: 17, type: !9)
!49 = !DILocation(line: 17, column: 62, scope: !39)
!50 = !DILocalVariable(name: "t_fptr", scope: !39, file: !6, line: 18, type: !13)
!51 = !DILocation(line: 18, column: 8, scope: !39)
!52 = !DILocation(line: 18, column: 26, scope: !39)
!53 = !DILocation(line: 18, column: 34, scope: !39)
!54 = !DILocation(line: 19, column: 17, scope: !39)
!55 = !DILocation(line: 19, column: 25, scope: !39)
!56 = !DILocation(line: 19, column: 2, scope: !39)
!57 = !DILocation(line: 19, column: 10, scope: !39)
!58 = !DILocation(line: 19, column: 16, scope: !39)
!59 = !DILocation(line: 20, column: 17, scope: !39)
!60 = !DILocation(line: 20, column: 2, scope: !39)
!61 = !DILocation(line: 20, column: 10, scope: !39)
!62 = !DILocation(line: 20, column: 16, scope: !39)
!63 = !DILocation(line: 21, column: 12, scope: !39)
!64 = !DILocation(line: 21, column: 19, scope: !39)
!65 = !DILocation(line: 21, column: 21, scope: !39)
!66 = !DILocation(line: 21, column: 5, scope: !39)
!67 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 23, type: !68, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16, !16, !16, !4, !4}
!70 = !DILocalVariable(name: "a", arg: 1, scope: !67, file: !6, line: 23, type: !16)
!71 = !DILocation(line: 23, column: 13, scope: !67)
!72 = !DILocalVariable(name: "b", arg: 2, scope: !67, file: !6, line: 23, type: !16)
!73 = !DILocation(line: 23, column: 20, scope: !67)
!74 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !67, file: !6, line: 23, type: !4)
!75 = !DILocation(line: 23, column: 38, scope: !67)
!76 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !67, file: !6, line: 23, type: !4)
!77 = !DILocation(line: 23, column: 61, scope: !67)
!78 = !DILocalVariable(name: "t_fptr", scope: !67, file: !6, line: 24, type: !10)
!79 = !DILocation(line: 24, column: 14, scope: !67)
!80 = !DILocation(line: 24, column: 23, scope: !67)
!81 = !DILocation(line: 24, column: 31, scope: !67)
!82 = !DILocation(line: 24, column: 21, scope: !67)
!83 = !DILocation(line: 25, column: 15, scope: !67)
!84 = !DILocation(line: 25, column: 23, scope: !67)
!85 = !DILocation(line: 25, column: 2, scope: !67)
!86 = !DILocation(line: 25, column: 10, scope: !67)
!87 = !DILocation(line: 25, column: 14, scope: !67)
!88 = !DILocation(line: 26, column: 12, scope: !67)
!89 = !DILocation(line: 26, column: 15, scope: !67)
!90 = !DILocation(line: 26, column: 18, scope: !67)
!91 = !DILocation(line: 26, column: 26, scope: !67)
!92 = !DILocation(line: 26, column: 5, scope: !67)
!93 = !DILocation(line: 27, column: 19, scope: !67)
!94 = !DILocation(line: 27, column: 26, scope: !67)
!95 = !DILocation(line: 27, column: 28, scope: !67)
!96 = !DILocation(line: 27, column: 12, scope: !67)
!97 = !DILocation(line: 27, column: 5, scope: !67)
!98 = distinct !DISubprogram(name: "moo", scope: !6, file: !6, line: 29, type: !99, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !16}
!101 = !DILocalVariable(name: "x", arg: 1, scope: !98, file: !6, line: 29, type: !16)
!102 = !DILocation(line: 29, column: 14, scope: !98)
!103 = !DILocalVariable(name: "a_fptr", scope: !98, file: !6, line: 31, type: !10)
!104 = !DILocation(line: 31, column: 14, scope: !98)
!105 = !DILocation(line: 32, column: 9, scope: !98)
!106 = !DILocation(line: 32, column: 15, scope: !98)
!107 = !DILocalVariable(name: "b_fptr", scope: !98, file: !6, line: 33, type: !10)
!108 = !DILocation(line: 33, column: 14, scope: !98)
!109 = !DILocation(line: 34, column: 9, scope: !98)
!110 = !DILocation(line: 34, column: 15, scope: !98)
!111 = !DILocalVariable(name: "s_fptr", scope: !98, file: !6, line: 36, type: !5)
!112 = !DILocation(line: 36, column: 15, scope: !98)
!113 = !DILocation(line: 37, column: 9, scope: !98)
!114 = !DILocation(line: 37, column: 13, scope: !98)
!115 = !DILocalVariable(name: "r_fptr", scope: !98, file: !6, line: 38, type: !5)
!116 = !DILocation(line: 38, column: 15, scope: !98)
!117 = !DILocation(line: 39, column: 9, scope: !98)
!118 = !DILocation(line: 39, column: 13, scope: !98)
!119 = !DILocalVariable(name: "w_fptr", scope: !98, file: !6, line: 41, type: !4)
!120 = !DILocation(line: 41, column: 16, scope: !98)
!121 = !DILocation(line: 41, column: 38, scope: !98)
!122 = !DILocation(line: 41, column: 23, scope: !98)
!123 = !DILocation(line: 43, column: 3, scope: !98)
!124 = !DILocation(line: 43, column: 10, scope: !98)
!125 = !DILocation(line: 44, column: 5, scope: !126)
!126 = distinct !DILexicalBlock(scope: !98, file: !6, line: 44, column: 5)
!127 = !DILocation(line: 44, column: 6, scope: !126)
!128 = !DILocation(line: 44, column: 5, scope: !98)
!129 = !DILocation(line: 46, column: 10, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !6, line: 45, column: 2)
!131 = !DILocation(line: 46, column: 12, scope: !130)
!132 = !DILocation(line: 46, column: 4, scope: !130)
!133 = !DILocation(line: 47, column: 2, scope: !130)
!134 = !DILocation(line: 49, column: 3, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !6, line: 48, column: 2)
!136 = !DILocation(line: 49, column: 11, scope: !135)
!137 = !DILocation(line: 49, column: 17, scope: !135)
!138 = !DILocation(line: 49, column: 23, scope: !135)
!139 = !DILocation(line: 51, column: 8, scope: !98)
!140 = !DILocation(line: 51, column: 10, scope: !98)
!141 = !DILocation(line: 51, column: 2, scope: !98)
!142 = !DILocation(line: 52, column: 1, scope: !98)
