##
## EPITECH PROJECT, 2021
## asm [WSL: Ubuntu]
## File description:
## Makefile
##

SRC = 	src/memcpy.asm		\
		src/memset.asm		\
		src/memmove.asm		\
		src/rindex.asm		\
		src/strcasecmp.asm	\
		src/strchr.asm		\
		src/strcmp.asm		\
		src/strcspn.asm		\
		src/strlen.asm		\
		src/strncmp.asm		\
		src/strpbrk.asm		\
		src/strstr.asm

SRCS_TESTS	=   

CC = ld
CCFLAGS = -shared -fPIC
AS = nasm
ASFLAGS = -f elf64

RM = rm -f

NAME = libasm.so

OBJ = $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CCFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

tests_run:	all
		@gcc ${SRCS_TESTS} --coverage -lcriterion -lgcov -ldl
		@echo -e "\e[5m\e[33mCriterion\e[25m\e[39m"
		@./a.out

.PHONY: all clean fclean re
