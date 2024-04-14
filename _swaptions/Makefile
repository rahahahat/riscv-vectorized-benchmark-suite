SPIKE := spike
PK := pk
ifneq (,$(wildcard ../.env))
    include ../.env
    export
endif

all: auto_vec intrinsics

auto_vec:
	for entry in src/*.cpp ; do \
		${LLVM}/bin/clang++  -Wall --target=riscv64-unknown-elf -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o  $$entry.o  $$entry ; \
	done
	${LLVM}/bin/clang++ -Wall --target=riscv64-unknown-elf  -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2  -o bin/swp-av-rvv  src/*.cpp.o -lm;	\
	rm src/*.o;

intrinsics:
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/CumNormalInv.o src/CumNormalInv.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/MaxFunction.o src/MaxFunction.cpp	
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/RanUnif.o src/RanUnif.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/nr_routines.o src/nr_routines.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/icdf.o src/icdf.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR)  -O2 -c -o src/HJM_SimPath_Forward_Blocking.o src/HJM_SimPath_Forward_Blocking.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/HJM.o src/HJM.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/HJM_Swaption_Blocking.o src/HJM_Swaption_Blocking.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/HJM_Securities.o src/HJM_Securities.cpp
	${LLVM}/bin/clang++ -fno-vectorize -Wno-deprecated-register -Wall --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2   -o bin/swp-rvv  src/*.o -lm
	rm src/*.o

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) -ns 8 -sm 512 -nt 1


clean:
	rm bin/*
