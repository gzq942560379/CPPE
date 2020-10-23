; ModuleID = './assign2-tests/test07.c'
source_filename = "./assign2-tests/test07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !29 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !37, metadata !DIExpression()), !dbg !38
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !39
  %8 = load i32, i32* %4, align 4, !dbg !40
  %9 = load i32, i32* %5, align 4, !dbg !41
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !39
  ret i32 %10, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !43 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %11 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %10, metadata !59, metadata !DIExpression()), !dbg !61
  store i32 (i32, i32, i32 (i32, i32)*)* @clever, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %11, metadata !62, metadata !DIExpression()), !dbg !64
  store i32 0, i32* %11, align 4, !dbg !64
  %12 = load i8, i8* %4, align 1, !dbg !65
  %13 = sext i8 %12 to i32, !dbg !65
  %14 = icmp eq i32 %13, 43, !dbg !67
  br i1 %14, label %15, label %17, !dbg !68

15:                                               ; preds = %3
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !69
  store i32 (i32, i32)* %16, i32 (i32, i32)** %9, align 8, !dbg !71
  br label %19, !dbg !72

17:                                               ; preds = %3
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !73
  store i32 (i32, i32)* %18, i32 (i32, i32)** %9, align 8, !dbg !75
  br label %19

19:                                               ; preds = %17, %15
  %20 = load i32, i32* %5, align 4, !dbg !76
  %21 = icmp sgt i32 %20, 0, !dbg !78
  br i1 %21, label %22, label %28, !dbg !79

22:                                               ; preds = %19
  %23 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !80
  %24 = load i32, i32* %5, align 4, !dbg !81
  %25 = load i32, i32* %6, align 4, !dbg !82
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !83
  %27 = call i32 %23(i32 %24, i32 %25, i32 (i32, i32)* %26), !dbg !80
  store i32 %27, i32* %11, align 4, !dbg !84
  br label %34, !dbg !85

28:                                               ; preds = %19
  %29 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !86
  %30 = load i32, i32* %5, align 4, !dbg !87
  %31 = load i32, i32* %6, align 4, !dbg !88
  %32 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !89
  %33 = call i32 %29(i32 %30, i32 %31, i32 (i32, i32)* %32), !dbg !86
  store i32 %33, i32* %11, align 4, !dbg !90
  br label %34

34:                                               ; preds = %28, %22
  %35 = load i32, i32* %11, align 4, !dbg !91
  ret i32 %35, !dbg !92
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test07.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 1, type: !9, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test07.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !8, line: 1, type: !11)
!13 = !DILocation(line: 1, column: 14, scope: !7)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !8, line: 1, type: !11)
!15 = !DILocation(line: 1, column: 21, scope: !7)
!16 = !DILocation(line: 2, column: 11, scope: !7)
!17 = !DILocation(line: 2, column: 13, scope: !7)
!18 = !DILocation(line: 2, column: 12, scope: !7)
!19 = !DILocation(line: 2, column: 4, scope: !7)
!20 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 5, type: !9, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !8, line: 5, type: !11)
!22 = !DILocation(line: 5, column: 15, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !8, line: 5, type: !11)
!24 = !DILocation(line: 5, column: 22, scope: !20)
!25 = !DILocation(line: 6, column: 11, scope: !20)
!26 = !DILocation(line: 6, column: 13, scope: !20)
!27 = !DILocation(line: 6, column: 12, scope: !20)
!28 = !DILocation(line: 6, column: 4, scope: !20)
!29 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 9, type: !30, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11, !11, !11, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 9, type: !11)
!34 = !DILocation(line: 9, column: 16, scope: !29)
!35 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 9, type: !11)
!36 = !DILocation(line: 9, column: 23, scope: !29)
!37 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !29, file: !8, line: 9, type: !32)
!38 = !DILocation(line: 9, column: 32, scope: !29)
!39 = !DILocation(line: 10, column: 12, scope: !29)
!40 = !DILocation(line: 10, column: 19, scope: !29)
!41 = !DILocation(line: 10, column: 22, scope: !29)
!42 = !DILocation(line: 10, column: 5, scope: !29)
!43 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 14, type: !44, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11, !46, !11, !11}
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !8, line: 14, type: !46)
!48 = !DILocation(line: 14, column: 14, scope: !43)
!49 = !DILocalVariable(name: "op1", arg: 2, scope: !43, file: !8, line: 14, type: !11)
!50 = !DILocation(line: 14, column: 21, scope: !43)
!51 = !DILocalVariable(name: "op2", arg: 3, scope: !43, file: !8, line: 14, type: !11)
!52 = !DILocation(line: 14, column: 30, scope: !43)
!53 = !DILocalVariable(name: "a_fptr", scope: !43, file: !8, line: 15, type: !32)
!54 = !DILocation(line: 15, column: 11, scope: !43)
!55 = !DILocalVariable(name: "s_fptr", scope: !43, file: !8, line: 16, type: !32)
!56 = !DILocation(line: 16, column: 11, scope: !43)
!57 = !DILocalVariable(name: "t_fptr", scope: !43, file: !8, line: 17, type: !32)
!58 = !DILocation(line: 17, column: 11, scope: !43)
!59 = !DILocalVariable(name: "af_ptr", scope: !43, file: !8, line: 18, type: !60)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!61 = !DILocation(line: 18, column: 11, scope: !43)
!62 = !DILocalVariable(name: "result", scope: !43, file: !8, line: 19, type: !63)
!63 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 19, column: 14, scope: !43)
!65 = !DILocation(line: 20, column: 9, scope: !66)
!66 = distinct !DILexicalBlock(scope: !43, file: !8, line: 20, column: 9)
!67 = !DILocation(line: 20, column: 11, scope: !66)
!68 = !DILocation(line: 20, column: 9, scope: !43)
!69 = !DILocation(line: 21, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !8, line: 20, column: 19)
!71 = !DILocation(line: 21, column: 15, scope: !70)
!72 = !DILocation(line: 22, column: 5, scope: !70)
!73 = !DILocation(line: 24, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !66, file: !8, line: 23, column: 5)
!75 = !DILocation(line: 24, column: 15, scope: !74)
!76 = !DILocation(line: 27, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !43, file: !8, line: 27, column: 8)
!78 = !DILocation(line: 27, column: 12, scope: !77)
!79 = !DILocation(line: 27, column: 8, scope: !43)
!80 = !DILocation(line: 28, column: 16, scope: !77)
!81 = !DILocation(line: 28, column: 23, scope: !77)
!82 = !DILocation(line: 28, column: 28, scope: !77)
!83 = !DILocation(line: 28, column: 33, scope: !77)
!84 = !DILocation(line: 28, column: 14, scope: !77)
!85 = !DILocation(line: 28, column: 8, scope: !77)
!86 = !DILocation(line: 30, column: 16, scope: !77)
!87 = !DILocation(line: 30, column: 23, scope: !77)
!88 = !DILocation(line: 30, column: 28, scope: !77)
!89 = !DILocation(line: 30, column: 33, scope: !77)
!90 = !DILocation(line: 30, column: 14, scope: !77)
!91 = !DILocation(line: 31, column: 12, scope: !43)
!92 = !DILocation(line: 31, column: 5, scope: !43)
