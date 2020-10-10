FROM lczxxx123/llvm_10_hw:0.2

COPY . /root/AST_Interpreter
WORKDIR /root/AST_Interpreter/build
RUN rm -rf *
RUN cmake .. -DLLVM_DIR=/usr/local/llvm10ra
RUN make -j4

ENTRYPOINT ["./ast-interpreter"]



