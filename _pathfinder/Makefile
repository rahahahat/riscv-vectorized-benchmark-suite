GCC_TOOLCHAIN_DIR := /home/rahat/local/rv-gnu-tc-install
SYSROOT_DIR := $(GCC_TOOLCHAIN_DIR)/riscv64-unknown-elf

LLVM := /home/rahat/local/riscv-llvm/install
SPIKE := spike
PK := pk

target = pf-rvv

all: vector auto-vec

auto-vec:
	${LLVM}/bin/clang++ --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o pf-av-rvv src/pathfinder.cpp

vector:
	${LLVM}/bin/clang++ -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR   -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o $(target)  src/pathfinder.cpp


runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 32 32 out
