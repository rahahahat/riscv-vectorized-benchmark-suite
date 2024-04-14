SPIKE := spike
PK := pk
ifneq (,$(wildcard ../.env))
    include ../.env
    export
endif

all: auto_vec intrinsics

auto_vec:
	${LLVM}/bin/clang++ --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o bin/sc-av-rvv src/streamcluster.cpp -lm

intrinsics:
	${LLVM}/bin/clang++ -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -fno-vectorize -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o bin/sc-rvv  src/streamcluster.cpp -lm

# ${LLVM}/bin/llvm-objdump -D --mattr=+v ./bin/rvv-test > ./bin/dump_vector

runspike :
	echo >output.txt; \
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 3 10 128 128 128 10 none output.txt 1
