SPIKE := spike
PK := pk
ifneq (,$(wildcard ../.env))
    include ../.env
    export
endif

all: auto_vec intrinsics
auto_vec:
	${LLVM}/bin/clang++ --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o bin/blk-av-rvv src/blackscholes.cpp -lm
	rm -rf src/*.o

intrinsics:
	${LLVM}/bin/clang++ -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR   -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o bin/blk-rvv  src/blackscholes.cpp -lm
	rm -rf src/*.o

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 1 ./input/in_64K.input prices.txt
