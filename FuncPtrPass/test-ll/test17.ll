; ModuleID = './assign2-tests/test17.c'
source_filename = "./assign2-tests/test17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 0, i32* %1, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %2, metadata !14, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %2, align 4, !dbg !16
  br label %3, !dbg !17

3:                                                ; preds = %19, %0
  %4 = load i32, i32* %2, align 4, !dbg !18
  %5 = icmp slt i32 %4, 10, !dbg !20
  br i1 %5, label %6, label %22, !dbg !21

6:                                                ; preds = %3
  %7 = load i32, i32* %2, align 4, !dbg !22
  %8 = srem i32 %7, 2, !dbg !25
  %9 = icmp ne i32 %8, 0, !dbg !25
  br i1 %9, label %10, label %14, !dbg !26

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !27
  %12 = load i32, i32* %2, align 4, !dbg !28
  %13 = call i32 @plus(i32 %11, i32 %12), !dbg !29
  store i32 %13, i32* %1, align 4, !dbg !30
  br label %18, !dbg !31

14:                                               ; preds = %6
  %15 = load i32, i32* %1, align 4, !dbg !32
  %16 = load i32, i32* %2, align 4, !dbg !33
  %17 = call i32 @minus(i32 %15, i32 %16), !dbg !34
  store i32 %17, i32* %1, align 4, !dbg !35
  br label %18

18:                                               ; preds = %14, %10
  br label %19, !dbg !36

19:                                               ; preds = %18
  %20 = load i32, i32* %2, align 4, !dbg !37
  %21 = add nsw i32 %20, 1, !dbg !37
  store i32 %21, i32* %2, align 4, !dbg !37
  br label %3, !dbg !38, !llvm.loop !39

22:                                               ; preds = %3
  %23 = load i32, i32* %1, align 4, !dbg !41
  ret i32 %23, !dbg !42
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !43 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i32, i32* %3, align 4, !dbg !50
  %6 = load i32, i32* %4, align 4, !dbg !51
  %7 = add nsw i32 %5, %6, !dbg !52
  ret i32 %7, !dbg !53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !54 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !57, metadata !DIExpression()), !dbg !58
  %5 = load i32, i32* %3, align 4, !dbg !59
  %6 = load i32, i32* %4, align 4, !dbg !60
  %7 = sub nsw i32 %5, %6, !dbg !61
  ret i32 %7, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 ()* %0) #0 !dbg !63 {
  %2 = alloca i32 ()*, align 8
  store i32 ()* %0, i32 ()** %2, align 8
  call void @llvm.dbg.declare(metadata i32 ()** %2, metadata !67, metadata !DIExpression()), !dbg !68
  %3 = load i32 ()*, i32 ()** %2, align 8, !dbg !69
  %4 = call i32 %3(), !dbg !69
  ret i32 %4, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @moo(i32 (i32 ()*)* %0, i32 ()* %1) #0 !dbg !71 {
  %3 = alloca i32 (i32 ()*)*, align 8
  %4 = alloca i32 ()*, align 8
  store i32 (i32 ()*)* %0, i32 (i32 ()*)** %3, align 8
  call void @llvm.dbg.declare(metadata i32 (i32 ()*)** %3, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 ()* %1, i32 ()** %4, align 8
  call void @llvm.dbg.declare(metadata i32 ()** %4, metadata !77, metadata !DIExpression()), !dbg !78
  %5 = load i32 (i32 ()*)*, i32 (i32 ()*)** %3, align 8, !dbg !79
  %6 = load i32 ()*, i32 ()** %4, align 8, !dbg !80
  %7 = call i32 %5(i32 ()* %6), !dbg !79
  ret i32 %7, !dbg !81
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @use() #0 !dbg !82 {
  %1 = alloca i32 (i32 (i32 ()*)*, i32 ()*)*, align 8
  call void @llvm.dbg.declare(metadata i32 (i32 (i32 ()*)*, i32 ()*)** %1, metadata !83, metadata !DIExpression()), !dbg !85
  store i32 (i32 (i32 ()*)*, i32 ()*)* @moo, i32 (i32 (i32 ()*)*, i32 ()*)** %1, align 8, !dbg !86
  %2 = load i32 (i32 (i32 ()*)*, i32 ()*)*, i32 (i32 (i32 ()*)*, i32 ()*)** %1, align 8, !dbg !87
  %3 = call i32 %2(i32 (i32 ()*)* @foo, i32 ()* @clever), !dbg !87
  ret i32 %3, !dbg !88
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test17.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 6, type: !9, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test17.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", scope: !7, file: !8, line: 8, type: !11)
!13 = !DILocation(line: 8, column: 9, scope: !7)
!14 = !DILocalVariable(name: "i", scope: !15, file: !8, line: 9, type: !11)
!15 = distinct !DILexicalBlock(scope: !7, file: !8, line: 9, column: 5)
!16 = !DILocation(line: 9, column: 13, scope: !15)
!17 = !DILocation(line: 9, column: 9, scope: !15)
!18 = !DILocation(line: 9, column: 17, scope: !19)
!19 = distinct !DILexicalBlock(scope: !15, file: !8, line: 9, column: 5)
!20 = !DILocation(line: 9, column: 18, scope: !19)
!21 = !DILocation(line: 9, column: 5, scope: !15)
!22 = !DILocation(line: 11, column: 12, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !8, line: 11, column: 12)
!24 = distinct !DILexicalBlock(scope: !19, file: !8, line: 10, column: 5)
!25 = !DILocation(line: 11, column: 13, scope: !23)
!26 = !DILocation(line: 11, column: 12, scope: !24)
!27 = !DILocation(line: 12, column: 20, scope: !23)
!28 = !DILocation(line: 12, column: 22, scope: !23)
!29 = !DILocation(line: 12, column: 15, scope: !23)
!30 = !DILocation(line: 12, column: 14, scope: !23)
!31 = !DILocation(line: 12, column: 13, scope: !23)
!32 = !DILocation(line: 14, column: 21, scope: !23)
!33 = !DILocation(line: 14, column: 23, scope: !23)
!34 = !DILocation(line: 14, column: 15, scope: !23)
!35 = !DILocation(line: 14, column: 14, scope: !23)
!36 = !DILocation(line: 15, column: 5, scope: !24)
!37 = !DILocation(line: 9, column: 23, scope: !19)
!38 = !DILocation(line: 9, column: 5, scope: !19)
!39 = distinct !{!39, !21, !40}
!40 = !DILocation(line: 15, column: 5, scope: !15)
!41 = !DILocation(line: 16, column: 12, scope: !7)
!42 = !DILocation(line: 16, column: 5, scope: !7)
!43 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 37, type: !44, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11, !11, !11}
!46 = !DILocalVariable(name: "a", arg: 1, scope: !43, file: !8, line: 37, type: !11)
!47 = !DILocation(line: 37, column: 14, scope: !43)
!48 = !DILocalVariable(name: "b", arg: 2, scope: !43, file: !8, line: 37, type: !11)
!49 = !DILocation(line: 37, column: 21, scope: !43)
!50 = !DILocation(line: 39, column: 12, scope: !43)
!51 = !DILocation(line: 39, column: 14, scope: !43)
!52 = !DILocation(line: 39, column: 13, scope: !43)
!53 = !DILocation(line: 39, column: 5, scope: !43)
!54 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 33, type: !44, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "a", arg: 1, scope: !54, file: !8, line: 33, type: !11)
!56 = !DILocation(line: 33, column: 15, scope: !54)
!57 = !DILocalVariable(name: "b", arg: 2, scope: !54, file: !8, line: 33, type: !11)
!58 = !DILocation(line: 33, column: 21, scope: !54)
!59 = !DILocation(line: 35, column: 12, scope: !54)
!60 = !DILocation(line: 35, column: 14, scope: !54)
!61 = !DILocation(line: 35, column: 13, scope: !54)
!62 = !DILocation(line: 35, column: 5, scope: !54)
!63 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 18, type: !64, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!11, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!67 = !DILocalVariable(name: "pf_ptr", arg: 1, scope: !63, file: !8, line: 18, type: !66)
!68 = !DILocation(line: 18, column: 14, scope: !63)
!69 = !DILocation(line: 20, column: 12, scope: !63)
!70 = !DILocation(line: 20, column: 5, scope: !63)
!71 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 23, type: !72, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!11, !74, !66}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!75 = !DILocalVariable(name: "uf_ptr", arg: 1, scope: !71, file: !8, line: 23, type: !74)
!76 = !DILocation(line: 23, column: 15, scope: !71)
!77 = !DILocalVariable(name: "pf_ptr", arg: 2, scope: !71, file: !8, line: 23, type: !66)
!78 = !DILocation(line: 23, column: 42, scope: !71)
!79 = !DILocation(line: 25, column: 12, scope: !71)
!80 = !DILocation(line: 25, column: 19, scope: !71)
!81 = !DILocation(line: 25, column: 5, scope: !71)
!82 = distinct !DISubprogram(name: "use", scope: !8, file: !8, line: 27, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "uf_ptr", scope: !82, file: !8, line: 29, type: !84)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!85 = !DILocation(line: 29, column: 11, scope: !82)
!86 = !DILocation(line: 30, column: 11, scope: !82)
!87 = !DILocation(line: 31, column: 12, scope: !82)
!88 = !DILocation(line: 31, column: 5, scope: !82)
