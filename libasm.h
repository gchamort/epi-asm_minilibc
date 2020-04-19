/*
** libasm.h for libasm.h in /home/loeb_t/rendu/asm_minilibc
**
** Made by LOEB Thomas
** Login   <loeb_t@epitech.net>
**
** Started on  Wed Mar 19 12:48:19 2014 LOEB Thomas
** Last update Wed Mar 19 16:55:25 2014 LOEB Thomas
*/

#ifndef			LIBASM_H_
# define		LIBASM_H_

extern int		my_strlen(char *);

extern char		*my_strstr(const char *, const char *);

extern void		*my_memset(void *, int, unsigned int);
extern void		*my_memcpy(void *, const void *, unsigned int);
extern void		*my_memmove(void *, const void *, unsigned int);

extern int		my_strcmp(const char *, const char *);
extern int		my_strncmp(const char *, const char *, unsigned int);
extern int		my_strcasecmp(const char *, const char *);

extern char		*my_rindex(const char *, int);
extern char		*my_strchr(const char *, int);

extern char		*my_strpbrk(const char *, const char *);
extern unsigned int	my_strcspn(const char *, const char *);

#endif
