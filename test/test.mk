
vpath %.c source

some_binary: *.c	
#	touch some_binary
*.c:
	touch source/f1.c
	touch source/f2.c
 
clean:
	del /Q *.c