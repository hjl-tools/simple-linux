CC=gcc
CFLAGS=-g -O0
ASFLAGS=-g -fcf-protection -Wa,-mx86-used-note=no
LD=ld
LDFLAGS=

EXES=test1 test2

OBJS=start.o syscall.o

all: $(EXES)
	./test1 hello world
	./test2 hello world

test1: $(OBJS) test1.o
	$(LD) $(LDFLAGS) -o $@ $^

test2: $(OBJS) test2.o
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(OBJS) $(EXES)
