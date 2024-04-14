SPIKE := spike
PK := pk
ifneq (,$(wildcard ../.env))
    include ../.env
    export
endif

all: auto_vec intrinsics

auto_vec:
	${LLVM}/bin/clang++ --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o bin/pf-av-rvv src/pathfinder.cpp

intrinsics:
	${LLVM}/bin/clang++ -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR   -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o bin/pf-rvv  src/pathfinder.cpp

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 32 32 out
