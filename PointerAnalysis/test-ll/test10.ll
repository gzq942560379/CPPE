; ModuleID = './assign3-tests/test10.c'
source_filename = "./assign3-tests/test10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }
%struct.wfsptr = type { %struct.fsptr* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !25 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !28, metadata !DIExpression()), !dbg !29
  %5 = load i32, i32* %3, align 4, !dbg !30
  %6 = load i32, i32* %4, align 4, !dbg !31
  %7 = add nsw i32 %5, %6, !dbg !32
  ret i32 %7, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !34 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !37, metadata !DIExpression()), !dbg !38
  %5 = load i32, i32* %3, align 4, !dbg !39
  %6 = load i32, i32* %4, align 4, !dbg !40
  %7 = sub nsw i32 %5, %6, !dbg !41
  ret i32 %7, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32 %0) #0 !dbg !43 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fsptr, align 8
  %5 = alloca %struct.wfsptr*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata %struct.fsptr* %4, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %5, metadata !52, metadata !DIExpression()), !dbg !53
  %6 = call noalias i8* @malloc(i64 8) #3, !dbg !54
  %7 = bitcast i8* %6 to %struct.wfsptr*, !dbg !55
  store %struct.wfsptr* %7, %struct.wfsptr** %5, align 8, !dbg !53
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !56
  store %struct.fptr* %3, %struct.fptr** %8, align 8, !dbg !57
  %9 = load %struct.wfsptr*, %struct.wfsptr** %5, align 8, !dbg !58
  %10 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %9, i32 0, i32 0, !dbg !59
  store %struct.fsptr* %4, %struct.fsptr** %10, align 8, !dbg !60
  %11 = load i32, i32* %2, align 4, !dbg !61
  %12 = icmp sgt i32 %11, 1, !dbg !63
  br i1 %12, label %13, label %22, !dbg !64

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !65
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %14, align 8, !dbg !67
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !68
  %16 = load %struct.fptr*, %struct.fptr** %15, align 8, !dbg !68
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !69
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %17, align 8, !dbg !69
  %19 = load i32, i32* %2, align 4, !dbg !70
  %20 = call i32 %18(i32 1, i32 %19), !dbg !71
  store i32 %20, i32* %2, align 4, !dbg !72
  %21 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !73
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %21, align 8, !dbg !74
  br label %29, !dbg !75

22:                                               ; preds = %1
  %23 = load %struct.wfsptr*, %struct.wfsptr** %5, align 8, !dbg !76
  %24 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %23, i32 0, i32 0, !dbg !78
  %25 = load %struct.fsptr*, %struct.fsptr** %24, align 8, !dbg !78
  %26 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %25, i32 0, i32 0, !dbg !79
  %27 = load %struct.fptr*, %struct.fptr** %26, align 8, !dbg !79
  %28 = getelementptr inbounds %struct.fptr, %struct.fptr* %27, i32 0, i32 0, !dbg !80
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %28, align 8, !dbg !81
  br label %29

29:                                               ; preds = %22, %13
  %30 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !82
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %30, align 8, !dbg !82
  %32 = load i32, i32* %2, align 4, !dbg !83
  %33 = call i32 %31(i32 1, i32 %32), !dbg !84
  store i32 %33, i32* %2, align 4, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test10.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "wfsptr", file: !6, line: 10, size: 64, elements: !7)
!6 = !DIFile(filename: "./assign3-tests/test10.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!7 = !{!8}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "wfptr", scope: !5, file: !6, line: 12, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !6, line: 6, size: 64, elements: !11)
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !10, file: !6, line: 8, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !6, line: 2, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !14, file: !6, line: 4, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20, !20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{!"clang version 10.0.0 "}
!25 = distinct !DISubprogram(name: "plus", scope: !6, file: !6, line: 14, type: !18, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !6, line: 14, type: !20)
!27 = !DILocation(line: 14, column: 14, scope: !25)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !6, line: 14, type: !20)
!29 = !DILocation(line: 14, column: 21, scope: !25)
!30 = !DILocation(line: 15, column: 11, scope: !25)
!31 = !DILocation(line: 15, column: 13, scope: !25)
!32 = !DILocation(line: 15, column: 12, scope: !25)
!33 = !DILocation(line: 15, column: 4, scope: !25)
!34 = distinct !DISubprogram(name: "minus", scope: !6, file: !6, line: 18, type: !18, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !34, file: !6, line: 18, type: !20)
!36 = !DILocation(line: 18, column: 15, scope: !34)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !34, file: !6, line: 18, type: !20)
!38 = !DILocation(line: 18, column: 22, scope: !34)
!39 = !DILocation(line: 19, column: 11, scope: !34)
!40 = !DILocation(line: 19, column: 13, scope: !34)
!41 = !DILocation(line: 19, column: 12, scope: !34)
!42 = !DILocation(line: 19, column: 4, scope: !34)
!43 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 21, type: !44, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !20}
!46 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !6, line: 21, type: !20)
!47 = !DILocation(line: 21, column: 14, scope: !43)
!48 = !DILocalVariable(name: "a_fptr", scope: !43, file: !6, line: 23, type: !14)
!49 = !DILocation(line: 23, column: 14, scope: !43)
!50 = !DILocalVariable(name: "s_fptr", scope: !43, file: !6, line: 24, type: !10)
!51 = !DILocation(line: 24, column: 15, scope: !43)
!52 = !DILocalVariable(name: "w_fptr", scope: !43, file: !6, line: 25, type: !4)
!53 = !DILocation(line: 25, column: 17, scope: !43)
!54 = !DILocation(line: 25, column: 40, scope: !43)
!55 = !DILocation(line: 25, column: 24, scope: !43)
!56 = !DILocation(line: 26, column: 9, scope: !43)
!57 = !DILocation(line: 26, column: 13, scope: !43)
!58 = !DILocation(line: 27, column: 2, scope: !43)
!59 = !DILocation(line: 27, column: 10, scope: !43)
!60 = !DILocation(line: 27, column: 15, scope: !43)
!61 = !DILocation(line: 28, column: 5, scope: !62)
!62 = distinct !DILexicalBlock(scope: !43, file: !6, line: 28, column: 5)
!63 = !DILocation(line: 28, column: 6, scope: !62)
!64 = !DILocation(line: 28, column: 5, scope: !43)
!65 = !DILocation(line: 30, column: 11, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !6, line: 29, column: 2)
!67 = !DILocation(line: 30, column: 17, scope: !66)
!68 = !DILocation(line: 31, column: 13, scope: !66)
!69 = !DILocation(line: 31, column: 19, scope: !66)
!70 = !DILocation(line: 31, column: 28, scope: !66)
!71 = !DILocation(line: 31, column: 6, scope: !66)
!72 = !DILocation(line: 31, column: 5, scope: !66)
!73 = !DILocation(line: 32, column: 11, scope: !66)
!74 = !DILocation(line: 32, column: 17, scope: !66)
!75 = !DILocation(line: 33, column: 2, scope: !66)
!76 = !DILocation(line: 35, column: 3, scope: !77)
!77 = distinct !DILexicalBlock(scope: !62, file: !6, line: 34, column: 2)
!78 = !DILocation(line: 35, column: 11, scope: !77)
!79 = !DILocation(line: 35, column: 18, scope: !77)
!80 = !DILocation(line: 35, column: 24, scope: !77)
!81 = !DILocation(line: 35, column: 30, scope: !77)
!82 = !DILocation(line: 37, column: 11, scope: !43)
!83 = !DILocation(line: 37, column: 20, scope: !43)
!84 = !DILocation(line: 37, column: 4, scope: !43)
!85 = !DILocation(line: 37, column: 3, scope: !43)
!86 = !DILocation(line: 38, column: 1, scope: !43)
