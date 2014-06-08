#!/usr/bin/make -f

ssreflect-pp: src/ssreflect.ml src/ssrmatching.ml

include Makefile.coq

PP_CMD = $(CAMLP4BIN)$(CAMLP4)o -I $(CAMLLIB) -I . $(COQSRCLIBS) $(CAMLP4EXTEND) $(GRAMMARS) $(CAMLP4OPTIONS) -impl

src/%.ml: src/%.ml4
	$(PP_CMD) $< > $@
