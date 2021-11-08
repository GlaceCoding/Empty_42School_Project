#!/bin/sh

make
if [[ $? == 0 ]]; then
	gcc ./test/test.c ./srcs/is_alphabet.c && ./a.out && rm ./a.out
	norminette ./srcs/*.c ./includes/*.h | grep -v ": OK!"
	exit 0
fi
exit 1
