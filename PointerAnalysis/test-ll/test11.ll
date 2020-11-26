; ModuleID = './assign3-tests/test11.c'
source_filename = "./assign3-tests/test11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !13 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !18
  %5 = load i32, i32* %3, align 4, !dbg !19
  %6 = load i32, i32* %4, align 4, !dbg !20
  %7 = add nsw i32 %5, %6, !dbg !21
  ret i32 %7, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !23 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !26, metadata !DIExpression()), !dbg !27
  %5 = load i32, i32* %3, align 4, !dbg !28
  %6 = load i32, i32* %4, align 4, !dbg !29
  %7 = sub nsw i32 %5, %6, !dbg !30
  ret i32 %7, !dbg !31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !32 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !39, metadata !DIExpression()), !dbg !40
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !41
  %8 = load i32, i32* %4, align 4, !dbg !42
  %9 = load i32, i32* %5, align 4, !dbg !43
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !41
  ret i32 %10, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !45 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)**, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %9, metadata !59, metadata !DIExpression()), !dbg !60
  %11 = call noalias i8* @malloc(i64 8) #3, !dbg !61
  %12 = bitcast i8* %11 to i32 (i32, i32)**, !dbg !62
  store i32 (i32, i32)** %12, i32 (i32, i32)*** %9, align 8, !dbg !60
  %13 = load i8, i8* %4, align 1, !dbg !63
  %14 = sext i8 %13 to i32, !dbg !63
  %15 = icmp eq i32 %14, 43, !dbg !65
  br i1 %15, label %16, label %19, !dbg !66

16:                                               ; preds = %3
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !67
  %18 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !69
  store i32 (i32, i32)* %17, i32 (i32, i32)** %18, align 8, !dbg !70
  br label %19, !dbg !71

19:                                               ; preds = %16, %3
  %20 = load i8, i8* %4, align 1, !dbg !72
  %21 = sext i8 %20 to i32, !dbg !72
  %22 = icmp eq i32 %21, 45, !dbg !74
  br i1 %22, label %23, label %26, !dbg !75

23:                                               ; preds = %19
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !76
  %25 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !78
  store i32 (i32, i32)* %24, i32 (i32, i32)** %25, align 8, !dbg !79
  br label %26, !dbg !80

26:                                               ; preds = %23, %19
  call void @llvm.dbg.declare(metadata i32* %10, metadata !81, metadata !DIExpression()), !dbg !83
  %27 = load i32, i32* %5, align 4, !dbg !84
  %28 = load i32, i32* %6, align 4, !dbg !85
  %29 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !86
  %30 = load i32 (i32, i32)*, i32 (i32, i32)** %29, align 8, !dbg !87
  %31 = call i32 @clever(i32 %27, i32 %28, i32 (i32, i32)* %30), !dbg !88
  store i32 %31, i32* %10, align 4, !dbg !83
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign3-tests/test11.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !8, !8}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "plus", scope: !14, file: !14, line: 2, type: !6, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./assign3-tests/test11.c", directory: "/home/gzq/CPPE/PointerAnalysis")
!15 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !14, line: 2, type: !8)
!16 = !DILocation(line: 2, column: 14, scope: !13)
!17 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !14, line: 2, type: !8)
!18 = !DILocation(line: 2, column: 21, scope: !13)
!19 = !DILocation(line: 3, column: 11, scope: !13)
!20 = !DILocation(line: 3, column: 13, scope: !13)
!21 = !DILocation(line: 3, column: 12, scope: !13)
!22 = !DILocation(line: 3, column: 4, scope: !13)
!23 = distinct !DISubprogram(name: "minus", scope: !14, file: !14, line: 6, type: !6, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !14, line: 6, type: !8)
!25 = !DILocation(line: 6, column: 15, scope: !23)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !23, file: !14, line: 6, type: !8)
!27 = !DILocation(line: 6, column: 22, scope: !23)
!28 = !DILocation(line: 7, column: 11, scope: !23)
!29 = !DILocation(line: 7, column: 13, scope: !23)
!30 = !DILocation(line: 7, column: 12, scope: !23)
!31 = !DILocation(line: 7, column: 4, scope: !23)
!32 = distinct !DISubprogram(name: "clever", scope: !14, file: !14, line: 10, type: !33, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!8, !8, !8, !5}
!35 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !14, line: 10, type: !8)
!36 = !DILocation(line: 10, column: 16, scope: !32)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !14, line: 10, type: !8)
!38 = !DILocation(line: 10, column: 23, scope: !32)
!39 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !32, file: !14, line: 10, type: !5)
!40 = !DILocation(line: 10, column: 32, scope: !32)
!41 = !DILocation(line: 11, column: 12, scope: !32)
!42 = !DILocation(line: 11, column: 19, scope: !32)
!43 = !DILocation(line: 11, column: 22, scope: !32)
!44 = !DILocation(line: 11, column: 5, scope: !32)
!45 = distinct !DISubprogram(name: "moo", scope: !14, file: !14, line: 15, type: !46, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!8, !48, !8, !8}
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "x", arg: 1, scope: !45, file: !14, line: 15, type: !48)
!50 = !DILocation(line: 15, column: 14, scope: !45)
!51 = !DILocalVariable(name: "op1", arg: 2, scope: !45, file: !14, line: 15, type: !8)
!52 = !DILocation(line: 15, column: 21, scope: !45)
!53 = !DILocalVariable(name: "op2", arg: 3, scope: !45, file: !14, line: 15, type: !8)
!54 = !DILocation(line: 15, column: 30, scope: !45)
!55 = !DILocalVariable(name: "a_fptr", scope: !45, file: !14, line: 16, type: !5)
!56 = !DILocation(line: 16, column: 11, scope: !45)
!57 = !DILocalVariable(name: "s_fptr", scope: !45, file: !14, line: 17, type: !5)
!58 = !DILocation(line: 17, column: 11, scope: !45)
!59 = !DILocalVariable(name: "t_fptr", scope: !45, file: !14, line: 18, type: !4)
!60 = !DILocation(line: 18, column: 12, scope: !45)
!61 = !DILocation(line: 18, column: 52, scope: !45)
!62 = !DILocation(line: 18, column: 32, scope: !45)
!63 = !DILocation(line: 20, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !45, file: !14, line: 20, column: 9)
!65 = !DILocation(line: 20, column: 11, scope: !64)
!66 = !DILocation(line: 20, column: 9, scope: !45)
!67 = !DILocation(line: 21, column: 18, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !14, line: 20, column: 19)
!69 = !DILocation(line: 21, column: 9, scope: !68)
!70 = !DILocation(line: 21, column: 16, scope: !68)
!71 = !DILocation(line: 22, column: 5, scope: !68)
!72 = !DILocation(line: 23, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !45, file: !14, line: 23, column: 9)
!74 = !DILocation(line: 23, column: 11, scope: !73)
!75 = !DILocation(line: 23, column: 9, scope: !45)
!76 = !DILocation(line: 24, column: 18, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !14, line: 23, column: 19)
!78 = !DILocation(line: 24, column: 9, scope: !77)
!79 = !DILocation(line: 24, column: 16, scope: !77)
!80 = !DILocation(line: 25, column: 5, scope: !77)
!81 = !DILocalVariable(name: "result", scope: !45, file: !14, line: 27, type: !82)
!82 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!83 = !DILocation(line: 27, column: 14, scope: !45)
!84 = !DILocation(line: 27, column: 30, scope: !45)
!85 = !DILocation(line: 27, column: 35, scope: !45)
!86 = !DILocation(line: 27, column: 41, scope: !45)
!87 = !DILocation(line: 27, column: 40, scope: !45)
!88 = !DILocation(line: 27, column: 23, scope: !45)
!89 = !DILocation(line: 28, column: 5, scope: !45)
