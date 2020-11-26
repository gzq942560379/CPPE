#!/bin/bash

test_file_bc_dir=./test-bc
runtime_bc_dir=./runtime-bc

for file in `ls $test_file_bc_dir`
do
    ./build/assignment3 $test_file_bc_dir/$file &> $runtime_bc_dir/$file
done

