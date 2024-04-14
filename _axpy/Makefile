SPIKE := spike
PK := pk
ifneq (,$(wildcard ../.env))
    include ../.env
    export
endif

all: auto_vec intrinsics
auto_vec:
	${LLVM}/bin/clang  -Wall --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -c -o src/axpy.o src/axpy.c
	${LLVM}/bin/clang  -Wall --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -c -o src/main.o src/main.c
	${LLVM}/bin/clang  -Wall --target=riscv64-unknown-elf  -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -c -o src/utils.o src/utils.c
	${LLVM}/bin/clang  -Wall --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o bin/axpy-av-rvv src/*.o -lm
	rm -rf src/*.o
intrinsics:
	${LLVM}/bin/clang -fno-vectorize -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR  -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -c -o src/utils.o src/utils.c
	${LLVM}/bin/clang -fno-vectorize -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -c -o src/axpy.o src/axpy.c
	${LLVM}/bin/clang -fno-vectorize -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR  -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -c -o src/main.o src/main.c
	${LLVM}/bin/clang -fno-vectorize -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions -O2  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -o bin/axpy-rvv src/*.o -lm  
	rm -rf src/*.o
runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 256
