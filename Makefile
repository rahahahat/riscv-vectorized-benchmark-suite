BASE_DIR := $(shell pwd)

APPLICATION_DIRS := _blackscholes _swaptions _streamcluster _canneal _particlefilter _pathfinder _jacobi-2d _axpy

all: blackscholes swaptions streamcluster canneal pathfinder jacobi-2d axpy

blackscholes:
	cd _blackscholes; 	\
	make all

swaptions:
	cd _swaptions; 		\
	make all

streamcluster:
	cd _streamcluster; 	\
	make all

canneal:
	cd _canneal; 		\
	make all

pathfinder:
	cd _pathfinder;		\
	make all

jacobi-2d:
	cd _jacobi-2d;		\
	make all

axpy:
	cd _axpy; 			\
	make all
clean:
	for dir in $(APPLICATION_DIRS) ; do cd $$dir ; rm -rf bin/*; cd .. ; done
