.PHONY: all clean build-c build-ocaml build-sbcl build-python

all: build-c build-ocaml build-sbcl build-python

build-c:
	@mkdir -p bin
	cc c/server.c -o bin/cserver

build-ocaml:
	@mkdir -p bin
	ocamlopt -o bin/ocamlserver unix.cmxa ocaml/server.ml

build-python:
	@mkdir -p bin
	python -m py_compile python/server.py
	@mv python/server.pyc bin/pythonserver

build-sbcl:
	@mkdir -p bin
	sbcl --eval $$'(progn (load "sbcl/server.lisp") (sb-ext:save-lisp-and-die "bin/sbclserver" :toplevel \'main :executable t))'

clean:
	@rm -rf bin
