EXE= main
DEBUG_FLAGS = -gstabs

all: $(EXE)

debug:
	as $(DEBUG_FLAGS) --32 src/main.s -o obj/main.o

main.o:
	as --32 src/main.s -o obj/main.o

main: main.o
	echo "main"
	ld -m elf_i386 obj/main.o -o bin/main

clean:
	find . -type f -name *main* ! -name *.s -delete

