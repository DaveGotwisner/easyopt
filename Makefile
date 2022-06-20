CFLAGS= -O0 -g

all: testArgs

testArgs: testArgs.c testArgsAssignFcns.inc testArgsValidateFcns.inc libeasyopts.a
	${CC} ${CFLAGS} -o testArgs testArgs.c -L. -leasyopts

libeasyopts.a: easyopts.h easyopts.c
	${CC} -c ${CFLAGS} -o easyopts.o easyopts.c
	-rm -f libeasyopts.a
	ar -crv libeasyopts.a easyopts.o

clean:
	-rm -f libeasyopts.a testArgs *.o
