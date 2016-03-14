SRCDIR=source
INCDIR=include
OUTDIR1=out

SOURCES=a.c b.c c.c d.c e.c f.c g.c
INCLUDES=a.h b.h c.h d.h e.h
OBJECTS=$(SOURCES:%.c=$(OUTDIR1)/%.o)
#OBJECTS=$(SOURCES:%.c=%.o)

DIRSRC:=$(SOURCES:%.c=$(SRCDIR)/%.c)
DIRINC:=$(INCLUDES:%.h=$(INCDIR)/%.h)

.SUFFIXES: .c .cpp .h .o

vpath %.c $(SRCDIR)
vpath %.cpp $(SRCDIR)
vpath %.h $(INCDIR)
vpath %.o $(OUTDIR1)

all: $(OBJECTS)
.PHONY: all

.PHONY: list
list: $(OBJECTS)
	-@echo SELAM OBJs: $(OBJECTS)

$(OBJECTS):$(OUTDIR1)/%.o:%.c %.h
#$(OBJECTS):%.o:%.c
	@echo $@: $?
	touch $@
	
.PHONY: prepare
prepare:
	touch $(DIRSRC)
	touch $(DIRINC)
#	mkdir $(OUTDIR1)

.PHONY:clean
clean:
	del /Q $(OUTDIR1)\*

.PHONY:distclean
distclean:
	del /Q $(SRCDIR)\*.c
	del /Q $(INCDIR)\*.h
	del /Q $(OUTDIR1)\*.o