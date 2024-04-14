GCC_TOOLCHAIN_DIR := /home/rahat/local/rv-gnu-tc-install
SYSROOT_DIR := $(GCC_TOOLCHAIN_DIR)/riscv64-unknown-elf

LLVM := /home/rahat/local/riscv-llvm/install
SPIKE := spike
PK := pk
target = blk-rvv

all: auto-vec vector
auto-vec:
	${LLVM}/bin/clang++ --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o blk-av-rvv src/blackscholes.cpp -lm
	rm -rf src/*.o

vector:
	${LLVM}/bin/clang++ -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR   -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o $(target)  src/blackscholes.cpp -lm
	rm -rf src/*.o

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 1 ./input/in_64K.input prices.txt
