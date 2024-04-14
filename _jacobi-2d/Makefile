GCC_TOOLCHAIN_DIR := /home/rahat/local/rv-gnu-tc-install
SYSROOT_DIR := $(GCC_TOOLCHAIN_DIR)/riscv64-unknown-elf

LLVM := /home/rahat/local/riscv-llvm/install
SPIKE := spike
PK := pk

target = bin/j2d-rvv

# start:
# 	mkdir -p bin; \
# 	rm bin/*.*
	
all: auto-vec vector
auto-vec:
	${LLVM}/bin/clang++ -Wall --target=riscv64-unknown-elf -march=rv64gcv --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/jacobi-2d.o src/jacobi-2d.cpp; \
	${LLVM}/bin/clang++ -Wall --target=riscv64-unknown-elf -march=rv64gcv --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o j2d-av-rvv src/*.o -lm; \
	rm src/*.o; \

vector:
	${LLVM}/bin/clang++ -Wall -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -c -o src/jacobi-2d.o src/jacobi-2d.cpp; \
	${LLVM}/bin/clang++ -Wall -fno-vectorize --target=riscv64-unknown-elf -DUSE_RISCV_VECTOR -march=rv64gcv1p0 -menable-experimental-extensions --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -O2 -o j2d-rvv src/*.o -lm ; \
	rm src/*.o ; \
	
# ${LLVM}/bin/llvm-objdump --mattr=+v -ds  bin/jacobi-2d_vector.exe > bin/jacobi-2d_vector.dump ; \

runspike :
	$(SPIKE) --isa=rv64gcv $(PK) $(target) 64 100 jacobi_2d.out

host:
	g++ -O2 -g -Wall -std=c99 -c -o  src/jacobi-2d.o  src/jacobi-2d.cpp ; \
	g++ -O2 -g -Wall -std=c99 -o  bin/jacobi-2d_host.exe  src/*.o  -lm; \
	rm src/*.o; \
	objdump -dC bin/jacobi-2d_host.exe > bin/jacobi-2d_host.dump ;

copy:
	rm -r ../../Test/_jacobi-2d/bin/*.exe; \
	cp -r bin/*exe ../../Test/_jacobi-2d/bin/;

clean:
	rm bin/*.dump; \
	rm bin/*.exe;