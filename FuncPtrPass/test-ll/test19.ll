; ModuleID = './assign2-tests/test19.c'
source_filename = "./assign2-tests/test19.c"
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
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !29 {
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
define dso_local i32 @clever() #0 !dbg !43 {
  %1 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %2 = alloca i32 (i32, i32)*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %1, metadata !46, metadata !DIExpression()), !dbg !48
  store i32 (i32, i32, i32 (i32, i32)*)* null, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %2, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 (i32, i32)* null, i32 (i32, i32)** %2, align 8, !dbg !50
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %3, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 1, i32* %3, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %4, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 2, i32* %4, align 4, !dbg !55
  %6 = load i32, i32* %3, align 4, !dbg !56
  %7 = icmp sgt i32 %6, 0, !dbg !58
  br i1 %7, label %8, label %9, !dbg !59

8:                                                ; preds = %0
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %2, align 8, !dbg !60
  br label %10, !dbg !61

9:                                                ; preds = %0
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %2, align 8, !dbg !62
  br label %10

10:                                               ; preds = %9, %8
  call void @llvm.dbg.declare(metadata i32* %5, metadata !63, metadata !DIExpression()), !dbg !65
  %11 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !66
  %12 = load i32, i32* %3, align 4, !dbg !67
  %13 = load i32, i32* %4, align 4, !dbg !68
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %2, align 8, !dbg !69
  %15 = call i32 %11(i32 %12, i32 %13, i32 (i32, i32)* %14), !dbg !66
  store i32 %15, i32* %5, align 4, !dbg !65
  ret i32 0, !dbg !70
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test19.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test19.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !8, line: 3, type: !11)
!13 = !DILocation(line: 3, column: 14, scope: !7)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !8, line: 3, type: !11)
!15 = !DILocation(line: 3, column: 21, scope: !7)
!16 = !DILocation(line: 4, column: 11, scope: !7)
!17 = !DILocation(line: 4, column: 13, scope: !7)
!18 = !DILocation(line: 4, column: 12, scope: !7)
!19 = !DILocation(line: 4, column: 4, scope: !7)
!20 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 7, type: !9, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !8, line: 7, type: !11)
!22 = !DILocation(line: 7, column: 15, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !8, line: 7, type: !11)
!24 = !DILocation(line: 7, column: 21, scope: !20)
!25 = !DILocation(line: 9, column: 12, scope: !20)
!26 = !DILocation(line: 9, column: 14, scope: !20)
!27 = !DILocation(line: 9, column: 13, scope: !20)
!28 = !DILocation(line: 9, column: 5, scope: !20)
!29 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 12, type: !30, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11, !11, !11, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !8, line: 12, type: !11)
!34 = !DILocation(line: 12, column: 13, scope: !29)
!35 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !8, line: 12, type: !11)
!36 = !DILocation(line: 12, column: 19, scope: !29)
!37 = !DILocalVariable(name: "fptr", arg: 3, scope: !29, file: !8, line: 12, type: !32)
!38 = !DILocation(line: 12, column: 27, scope: !29)
!39 = !DILocation(line: 14, column: 12, scope: !29)
!40 = !DILocation(line: 14, column: 17, scope: !29)
!41 = !DILocation(line: 14, column: 19, scope: !29)
!42 = !DILocation(line: 14, column: 5, scope: !29)
!43 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 16, type: !44, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11}
!46 = !DILocalVariable(name: "af_ptr", scope: !43, file: !8, line: 18, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!48 = !DILocation(line: 18, column: 11, scope: !43)
!49 = !DILocalVariable(name: "pf_ptr", scope: !43, file: !8, line: 19, type: !32)
!50 = !DILocation(line: 19, column: 11, scope: !43)
!51 = !DILocation(line: 20, column: 11, scope: !43)
!52 = !DILocalVariable(name: "op1", scope: !43, file: !8, line: 21, type: !11)
!53 = !DILocation(line: 21, column: 9, scope: !43)
!54 = !DILocalVariable(name: "op2", scope: !43, file: !8, line: 21, type: !11)
!55 = !DILocation(line: 21, column: 18, scope: !43)
!56 = !DILocation(line: 23, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !43, file: !8, line: 23, column: 9)
!58 = !DILocation(line: 23, column: 13, scope: !57)
!59 = !DILocation(line: 23, column: 9, scope: !43)
!60 = !DILocation(line: 24, column: 15, scope: !57)
!61 = !DILocation(line: 24, column: 9, scope: !57)
!62 = !DILocation(line: 26, column: 15, scope: !57)
!63 = !DILocalVariable(name: "result", scope: !43, file: !8, line: 28, type: !64)
!64 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 28, column: 14, scope: !43)
!66 = !DILocation(line: 28, column: 23, scope: !43)
!67 = !DILocation(line: 28, column: 30, scope: !43)
!68 = !DILocation(line: 28, column: 35, scope: !43)
!69 = !DILocation(line: 28, column: 39, scope: !43)
!70 = !DILocation(line: 29, column: 5, scope: !43)
