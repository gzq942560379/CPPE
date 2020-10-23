#!/bin/bash

test_file_c_dir=./assign2-tests
test_file_ll_dir=./test-ll
test_file_bc_dir=./test-bc

rm -rf $test_file_ll_dir $test_file_bc_dir

mkdir $test_file_ll_dir $test_file_bc_dir

for file in `ls $test_file_c_dir`
do
    filename=${file%.*}
    clang -g -O0 -emit-llvm $test_file_c_dir/$file -S -o $test_file_ll_dir/$filename.ll && 
    llvm-as $test_file_ll_dir/$filename.ll -o $test_file_bc_dir/$filename.bc
done

