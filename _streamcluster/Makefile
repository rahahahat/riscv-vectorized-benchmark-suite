GCC_TOOLCHAIN_DIR := /home/rahat/local/rv-gnu-tc-install
SYSROOT_DIR := $(GCC_TOOLCHAIN_DIR)/riscv64-unknown-elf

LLVM := /home/rahat/local/riscv-llvm/install
SPIKE := spike
PK := pk

target = sc-rvv
all: auto-vec vector

auto-vec:
	${LLVM}/bin/clang++ --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o sc-av-rvv src/streamcluster.cpp -lm

vector:
	${LLVM}/bin/clang++ -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -fno-vectorize -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -o $(target)  src/streamcluster.cpp -lm

# ${LLVM}/bin/llvm-objdump -D --mattr=+v ./bin/rvv-test > ./bin/dump_vector

runspike :
	echo >output.txt; \
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 3 10 128 128 128 10 none output.txt 1
