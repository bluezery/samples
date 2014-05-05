V = 0
CC_0 = @echo "Compiling $< ..."; gcc
CC_1 = gcc
CC = $(CC_$(V))

all: test_ldpreload

libldpreload.so: ldpreload.c
	$(CC) -shared -fPIC -g -o libldpreload.so ldpreload.c

preload: libldpreload.so preload.c
	$(CC) -g -o preload preload.c

test_ldpreload: preload
	@echo "**** start ldpreload testing *****"
	@LD_PRELOAD=./libldpreload.so ./preload

clean:
	rm -rf libldpreload.so preload
