all: main

main: build/main.o build/triangle.o
	gcc -arch x86_64 -o main build/main.o build/triangle.o

build/triangle.o: src/triangle.s build
	nasm -f macho64 -o build/triangle.o src/triangle.s

build/main.o: src/main.c build
	gcc -o build/main.o -c src/main.c

build:
	mkdir build

clean:
	rm build/main.o build/triangle.o main