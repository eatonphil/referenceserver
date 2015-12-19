# A barebones UNIX reference server

I find myself writing this server in some language every few months.
Each time I have to scour the web for a good reference. Use this
as a reference to write your own bare server in C or other languages
with a UNIX API (Python, OCaml, etc).

# Run

```bash
make build-c
bin/cserver # go to localhost:15000

make build-ocaml
bin/ocamlserver # go to localhost:15000

make build-python
python2.7 bin/pythonserver # go to localhost:15000
# -- OR --
python3.5 python/server.py # go to localhost:15000

make build-sbcl
bin/sbclserver # go to localhost:15000
```

# Notes

These servers are very minimal and require no external libraries.
They may suffer from serious problems (reading/writing completely,
blocking, etc). If you notice these issues, feel free to file an
issue or create a PR. If a fix does not seriously impede on the
simplicity of the example, the changes may be incorporated.