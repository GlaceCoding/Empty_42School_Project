#!/bin/sh

HEAD="./includes/"
LIBS=""

make
if [[ $? == 0 ]]; then
	SRCS=$(find ./srcs -iname "*.c" ! -name "main.c")

	echo "======= PROJECT DIFFS ======="
	./test/diff.sh "Hello world\n"

	echo "======= PROJECT TESTS ======="
	gcc -g -o test.out ./test/test.c $SRCS $LIBS -fno-builtin -I "$HEAD" && ./test.out && rm ./test.out

	echo "========= NORMINETTE ========"
	norminette ./srcs/*.c ./includes/*.h | grep -v ": OK!"
	echo "============================="
fi
