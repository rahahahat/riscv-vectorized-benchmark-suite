SPIKE := spike
PK := pk
ifneq (,$(wildcard ../.env))
    include ../.env
    export
endif

all: auto_vec intrinsics

auto_vec:
	${LLVM}/bin/clang -Wall --target=riscv64-unknown-elf -DMVL_$$mvl   -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/particlefilter.o src/particlefilter.c ; \
	${LLVM}/bin/clang -Wall --target=riscv64-unknown-elf -DMVL_$$mvl -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o $(target) src/*.o -lm ; \
vector:
	${LLVM}/bin/clang -fno-vectorize -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -DMVL_$$mvl -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/particlefilter.o src/particlefilter.c ; \
	${LLVM}/bin/clang -fno-vectorize -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -DMVL_$$mvl -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o $(target) src/*.o -lm ; \
	rm src/*.o 

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) -x 128 -y 128 -z 2 -np 256


clean:
	rm bin/*

	
