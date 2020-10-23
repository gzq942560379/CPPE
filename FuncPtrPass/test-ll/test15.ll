; ModuleID = './assign2-tests/test15.c'
source_filename = "./assign2-tests/test15.c"
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
define dso_local i32 @moo(i8 signext %0) #0 !dbg !43 {
  %2 = alloca i8, align 1
  %3 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  store i8 %0, i8* %2, align 1
  call void @llvm.dbg.declare(metadata i8* %2, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %3, metadata !49, metadata !DIExpression()), !dbg !51
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 (i32, i32)* null, i32 (i32, i32)** %4, align 8, !dbg !53
  %5 = load i8, i8* %2, align 1, !dbg !54
  %6 = sext i8 %5 to i32, !dbg !54
  %7 = icmp eq i32 %6, 43, !dbg !56
  br i1 %7, label %8, label %12, !dbg !57

8:                                                ; preds = %1
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %4, align 8, !dbg !58
  %9 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !60
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !61
  %11 = call i32 %9(i32 1, i32 2, i32 (i32, i32)* %10), !dbg !60
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !62
  br label %12, !dbg !63

12:                                               ; preds = %8, %1
  %13 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !64
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !65
  %15 = call i32 %13(i32 1, i32 2, i32 (i32, i32)* %14), !dbg !64
  ret i32 0, !dbg !66
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test15.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test15.c", directory: "/home/gzq/CPPE/FuncPtrPass")
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
!37 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !29, file: !8, line: 12, type: !32)
!38 = !DILocation(line: 12, column: 27, scope: !29)
!39 = !DILocation(line: 14, column: 12, scope: !29)
!40 = !DILocation(line: 14, column: 19, scope: !29)
!41 = !DILocation(line: 14, column: 21, scope: !29)
!42 = !DILocation(line: 14, column: 5, scope: !29)
!43 = distinct !DISubprogram(name: "moo", scope: !8, file: !8, line: 18, type: !44, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11, !46}
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !8, line: 18, type: !46)
!48 = !DILocation(line: 18, column: 14, scope: !43)
!49 = !DILocalVariable(name: "af_ptr", scope: !43, file: !8, line: 20, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!51 = !DILocation(line: 20, column: 11, scope: !43)
!52 = !DILocalVariable(name: "pf_ptr", scope: !43, file: !8, line: 21, type: !32)
!53 = !DILocation(line: 21, column: 11, scope: !43)
!54 = !DILocation(line: 22, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !43, file: !8, line: 22, column: 8)
!56 = !DILocation(line: 22, column: 10, scope: !55)
!57 = !DILocation(line: 22, column: 8, scope: !43)
!58 = !DILocation(line: 23, column: 15, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !8, line: 22, column: 17)
!60 = !DILocation(line: 24, column: 9, scope: !59)
!61 = !DILocation(line: 24, column: 20, scope: !59)
!62 = !DILocation(line: 25, column: 15, scope: !59)
!63 = !DILocation(line: 26, column: 5, scope: !59)
!64 = !DILocation(line: 27, column: 5, scope: !43)
!65 = !DILocation(line: 27, column: 16, scope: !43)
!66 = !DILocation(line: 28, column: 5, scope: !43)
