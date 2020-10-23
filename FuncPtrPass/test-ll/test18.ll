; ModuleID = './assign2-tests/test18.c'
source_filename = "./assign2-tests/test18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @use() #0 !dbg !7 {
  %1 = call i32 (...) @clever(), !dbg !12
  ret i32 %1, !dbg !13
}

declare dso_local i32 @clever(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !14 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !19, metadata !DIExpression()), !dbg !20
  %5 = load i32, i32* %3, align 4, !dbg !21
  %6 = load i32, i32* %4, align 4, !dbg !22
  %7 = sub nsw i32 %5, %6, !dbg !23
  ret i32 %7, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

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

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "assign2-tests/test18.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "use", scope: !8, file: !8, line: 6, type: !9, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./assign2-tests/test18.c", directory: "/home/gzq/CPPE/FuncPtrPass")
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocation(line: 8, column: 12, scope: !7)
!13 = !DILocation(line: 8, column: 5, scope: !7)
!14 = distinct !DISubprogram(name: "minus", scope: !8, file: !8, line: 10, type: !15, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{!11, !11, !11}
!17 = !DILocalVariable(name: "a", arg: 1, scope: !14, file: !8, line: 10, type: !11)
!18 = !DILocation(line: 10, column: 15, scope: !14)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !14, file: !8, line: 10, type: !11)
!20 = !DILocation(line: 10, column: 21, scope: !14)
!21 = !DILocation(line: 12, column: 12, scope: !14)
!22 = !DILocation(line: 12, column: 14, scope: !14)
!23 = !DILocation(line: 12, column: 13, scope: !14)
!24 = !DILocation(line: 12, column: 5, scope: !14)
!25 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 14, type: !15, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !8, line: 14, type: !11)
!27 = !DILocation(line: 14, column: 14, scope: !25)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !8, line: 14, type: !11)
!29 = !DILocation(line: 14, column: 21, scope: !25)
!30 = !DILocation(line: 16, column: 12, scope: !25)
!31 = !DILocation(line: 16, column: 14, scope: !25)
!32 = !DILocation(line: 16, column: 13, scope: !25)
!33 = !DILocation(line: 16, column: 5, scope: !25)
