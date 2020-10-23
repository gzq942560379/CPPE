#!/bin/bash


cd ./build/ && make && cd ..

./build/llvmassignment test-bc/test00.bc
./build/llvmassignment test-bc/test01.bc
./build/llvmassignment test-bc/test02.bc
./build/llvmassignment test-bc/test03.bc
./build/llvmassignment test-bc/test04.bc
./build/llvmassignment test-bc/test05.bc
./build/llvmassignment test-bc/test06.bc
./build/llvmassignment test-bc/test07.bc
./build/llvmassignment test-bc/test08.bc
./build/llvmassignment test-bc/test09.bc
./build/llvmassignment test-bc/test10.bc
./build/llvmassignment test-bc/test11.bc