.PHONY: default
default: cmitomli

cmitomli: cmitomli.ml
	ocamlopt -o cmitomli -I +compiler-libs ocamlcommon.cmxa cmitomli.ml

ifndef BINDIR
  ifdef PREFIX
    BINDIR = $(PREFIX)/bin
  else
    BINDIR = $(shell dirname `which ocamlopt`)
  endif
endif

.PHONY: install
install:
	cp cmitomli $(BINDIR)

.PHONY: clean
clean:
	rm -f *.cm[iox] *.o *~ cmitomli
