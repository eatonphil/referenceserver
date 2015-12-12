.PHONY: all clean build-c build-ocaml

all: build-c build-ocaml

build-c:
	@mkdir -p bin
	cc c/server.c -o bin/cserver

build-ocaml:
	@mkdir -p bin
	ocamlopt -o bin/ocamlserver unix.cmxa ocaml/server.ml

clean:
	@rm -rf bin
