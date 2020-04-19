##
## Makefile for Makefile in /home/loeb_t/rendu/asm_minilibc
## 
## Made by LOEB Thomas
## Login   <loeb_t@epitech.net>
## 
## Started on  Mon Mar  3 15:09:29 2014 LOEB Thomas
## Last update Wed Mar 19 17:14:24 2014 LOEB Thomas
##

NAME	= libasm.so

F_SRC	= src/

SRC	= $(F_SRC)strlen.S		\
	  $(F_SRC)strchr.S		\
	  $(F_SRC)memset.S		\
	  $(F_SRC)memcpy.S		\
	  $(F_SRC)strcmp.S		\
	  $(F_SRC)memmove.S		\
	  $(F_SRC)strncmp.S		\
	  $(F_SRC)strcasecmp.S		\
	  $(F_SRC)rindex.S		\
	  $(F_SRC)strstr.S		\
	  $(F_SRC)strcspn.S		\
	  $(F_SRC)strpbrk.S

OBJ	= $(SRC:.S=.o)

NASM	= nasm -f elf64

DYN_LIB	= -fPIC -shared

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(DYN_LIB) -o $(NAME) $(OBJ)

$(OBJ): %.o : %.S
	$(NASM) $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

main:
	cc main.c -L ./ -l :$(NAME)
	@echo "Set your LD_LIBRARY_PATH variable \
	to 'path_of_executable':${LD_LIBRARY_PATH} to launch your program"
