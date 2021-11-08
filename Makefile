# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gphilipp <gphilipp@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/18 14:24:46 by gphilipp          #+#    #+#              #
#    Updated: 2021/11/08 12:33:34 by gphilipp         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC			= main.c \
				is_alphabet.c

SRCS		= $(addprefix $(PRE), $(SRC))

OBJS		= $(SRCS:.c=.o)

PRE			= ./srcs/

HEAD		= ./includes/

NAME		= rendu

CC			= gcc

CFLAGS		= -Wall -Wextra -Werror

all:		$(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -I $(HEAD) -c $< -o $@

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
