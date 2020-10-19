#!/bin/bash

rm ./build/* -rf

cd build && cmake .. -DLLVM_DIR=/usr/local/llvm10ra && make && cd ..

./build/ast-interpreter "`cat ./test/test00.c`"
./build/ast-interpreter "`cat ./test/test01.c`"
./build/ast-interpreter "`cat ./test/test02.c`"
./build/ast-interpreter "`cat ./test/test03.c`"
./build/ast-interpreter "`cat ./test/test04.c`"
./build/ast-interpreter "`cat ./test/test05.c`"
./build/ast-interpreter "`cat ./test/test06.c`"
./build/ast-interpreter "`cat ./test/test07.c`"
./build/ast-interpreter "`cat ./test/test08.c`"
./build/ast-interpreter "`cat ./test/test09.c`"
./build/ast-interpreter "`cat ./test/test10.c`"
./build/ast-interpreter "`cat ./test/test11.c`"
./build/ast-interpreter "`cat ./test/test12.c`"
./build/ast-interpreter "`cat ./test/test13.c`"
./build/ast-interpreter "`cat ./test/test14.c`"
./build/ast-interpreter "`cat ./test/test15.c`"
./build/ast-interpreter "`cat ./test/test16.c`"
./build/ast-interpreter "`cat ./test/test18.c`"
./build/ast-interpreter "`cat ./test/test19.c`"
./build/ast-interpreter "`cat ./test/test20.c`"
./build/ast-interpreter "`cat ./test/test21.c`"
./build/ast-interpreter "`cat ./test/test22.c`"
./build/ast-interpreter "`cat ./test/test23.c`"
./build/ast-interpreter "`cat ./test/test24.c`"

# ./build/ast-interpreter ./test/test00.c
# ./build/ast-interpreter ./test/test01.c
# ./build/ast-interpreter ./test/test02.c
# ./build/ast-interpreter ./test/test03.c
# ./build/ast-interpreter ./test/test04.c
# ./build/ast-interpreter ./test/test05.c
# ./build/ast-interpreter ./test/test06.c
# ./build/ast-interpreter ./test/test07.c
# ./build/ast-interpreter ./test/test08.c
# ./build/ast-interpreter ./test/test09.c
# ./build/ast-interpreter ./test/test10.c
# ./build/ast-interpreter ./test/test11.c
# ./build/ast-interpreter ./test/test12.c
# ./build/ast-interpreter ./test/test13.c
# ./build/ast-interpreter ./test/test14.c
# ./build/ast-interpreter ./test/test15.c
# ./build/ast-interpreter ./test/test16.c
# ./build/ast-interpreter ./test/test17.c
# ./build/ast-interpreter ./test/test18.c
# ./build/ast-interpreter ./test/test19.c
# ./build/ast-interpreter ./test/test20.c
# ./build/ast-interpreter ./test/test21.c
# ./build/ast-interpreter ./test/test22.c
# ./build/ast-interpreter ./test/test23.c
# ./build/ast-interpreter ./test/test24.c