; ModuleID = './assign2-tests/test16.c'
source_filename = "./assign2-tests/test16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever() #0 !dbg !7 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 0, i32* %1, align 4, !dbg !13
  %2 = load i32, i32* %1, align 4, !dbg !14
  %3 = call i32 @plus(i32 %2, i32 10), !dbg !15
  %4 = call i32 @minus(i32 %3, i32 2), !dbg !16
  store i32 %4, i32* %1, align 4, !dbg !17
  %5 = load i32, i32* %1, align 4, !dbg !18
  %6 = call i32 @plus(i32 %5, i32 2), !dbg !19
  %7 = icmp ne i32 %6, 0, !dbg !19
  br i1 %7, label %8, label %11, !dbg !19

8:                                                ; preds = %0
  %9 = load i32, i32* %1, align 4, !dbg !20
  %10 = call i32 @minus(i32 6, i32 %9), !dbg !21
  br label %12, !dbg !19

11:                                               ; preds = %0
  br label %12, !dbg !19

12:                                               ; preds = %11, %8
  %13 = phi i32 [ %10, %8 ], [ 0, %11 ], !dbg !19
  store i32 %13, i32* %1, align 4, !dbg !22
  %14 = load i32, i32* %1, align 4, !dbg !23
  ret i32 %14, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !25 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !30, metadata !DIExpression()), !dbg !31
  %5 = load i32, i32* %3, align 4, !dbg !32
  %6 = load i32, i32* %4, align 4, !dbg !33
  %7 = sub nsw i32 %5, %6, !dbg !34
  ret i32 %7, !dbg !35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !36 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32, i32* %3, align 4, !dbg !41
  %6 = load i32, i32* %4, align 4, !dbg !42
  %7 = add nsw i32 %5, %6, !dbg !43
  ret i32 %7, !dbg !44
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test16.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "clever", scope: !8, file: !8, line: 6, type: !9, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test16.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", scope: !7, file: !8, line: 8, type: !11)
!13 = !DILocation(line: 8, column: 9, scope: !7)
!14 = !DILocation(line: 9, column: 18, scope: !7)
!15 = !DILocation(line: 9, column: 13, scope: !7)
!16 = !DILocation(line: 9, column: 7, scope: !7)
!17 = !DILocation(line: 9, column: 6, scope: !7)
!18 = !DILocation(line: 10, column: 12, scope: !7)
!19 = !DILocation(line: 10, column: 7, scope: !7)
!20 = !DILocation(line: 10, column: 25, scope: !7)
!21 = !DILocation(line: 10, column: 17, scope: !7)
!22 = !DILocation(line: 10, column: 6, scope: !7)
!23 = !DILocation(line: 11, column: 12, scope: !7)
!24 = !DILocation(line: 11, column: 5, scope: !7)
!25 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 14, type: !26, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!11, !11, !11}
!28 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !8, line: 14, type: !11)
!29 = !DILocation(line: 14, column: 15, scope: !25)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !8, line: 14, type: !11)
!31 = !DILocation(line: 14, column: 21, scope: !25)
!32 = !DILocation(line: 16, column: 12, scope: !25)
!33 = !DILocation(line: 16, column: 14, scope: !25)
!34 = !DILocation(line: 16, column: 13, scope: !25)
!35 = !DILocation(line: 16, column: 5, scope: !25)
!36 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 18, type: !26, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "a", arg: 1, scope: !36, file: !8, line: 18, type: !11)
!38 = !DILocation(line: 18, column: 14, scope: !36)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !36, file: !8, line: 18, type: !11)
!40 = !DILocation(line: 18, column: 21, scope: !36)
!41 = !DILocation(line: 20, column: 12, scope: !36)
!42 = !DILocation(line: 20, column: 14, scope: !36)
!43 = !DILocation(line: 20, column: 13, scope: !36)
!44 = !DILocation(line: 20, column: 5, scope: !36)
