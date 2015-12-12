.PHONY: all clean

all:
	@mkdir -p bin
	cc cserver.c -o bin/cserver

clean:
	@rm -rf bin
