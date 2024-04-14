GCC_TOOLCHAIN_DIR := /home/rahat/local/rv-gnu-tc-install
SYSROOT_DIR := $(GCC_TOOLCHAIN_DIR)/riscv64-unknown-elf

LLVM := /home/rahat/local/riscv-llvm/install
SPIKE := spike
PK := pk

target = swp-rvv

# start:
# 	mkdir bin; \
# 	rm bin/*.*
all: vector auto-vec

auto-vec:
	for entry in src/*.cpp ; do \
		${LLVM}/bin/clang++   -Wall --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o  $$entry.o  $$entry ; \
	done
	${LLVM}/bin/clang++ -Wall --target=riscv64-unknown-elf  -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2  -o swp-av-rvv  src/*.cpp.o -lm;	\
	rm src/*.o;

vector:
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/CumNormalInv.o src/CumNormalInv.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/MaxFunction.o src/MaxFunction.cpp	
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/RanUnif.o src/RanUnif.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/nr_routines.o src/nr_routines.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/icdf.o src/icdf.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/HJM_SimPath_Forward_Blocking.o src/HJM_SimPath_Forward_Blocking.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/HJM.o src/HJM.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/HJM_Swaption_Blocking.o src/HJM_Swaption_Blocking.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/HJM_Securities.o src/HJM_Securities.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2   -o $(target)  src/*.o -lm
	rm src/*.o

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) -ns 8 -sm 512 -nt 1


clean:
	rm bin/*
