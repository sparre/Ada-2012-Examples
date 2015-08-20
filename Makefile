include Makefile.project
-include .config

HG_STATE_SOURCE    = src/mercurial.ads
HG_MODIFIER        = `test $$(hg status | wc -c) -gt 0 && echo "plus changes" || echo "as committed"`
HG_REVISION        = `hg tip --template '{node}' 2>/dev/null || echo N/A`
GENERATED_SOURCES += $(HG_STATE_SOURCE)

EXECUTABLES=$(GENERATED_EXECUTABLES) $(SCRIPTS)

PREFIX ?= $(HOME)

all: build metrics

build: fix-whitespace $(GENERATED_SOURCES)
	gnatmake -p -P $(PROJECT)

test: build metrics
	@./tests/build
	@./tests/run

install: build test
	install -D -t $(DESTDIR)$(PREFIX)/bin/ $(EXECUTABLES)

clean:
	find . \( -name "*~" -o -name "*.bak" -o -name "*.o" -o -name "*.ali" -o -name "*.adt" \) -type f -print0 | xargs -0 -r /bin/rm
	if [ ! -z "$(GENERATED_SOURCES)" ]; then rm -f $(GENERATED_SOURCES) 2>/dev/null || true; fi
	rmdir bin || true
	rmdir obj || true

distclean: clean
	if [ ! -z "$(GENERATED_SOURCES)" ]; then rm -rf $(GENERATED_SOURCES); fi
	gnatclean -P $(PROJECT) || true
	rm -f $(GENERATED_EXECUTABLES)
	rm -f obj/*.ad[sb].metrix
	rmdir bin || true
	rmdir obj || true

fix-whitespace:
	@find src tests -name '*.ad?' | xargs -r egrep -l '	| $$' | grep -v '^b[~]' | xargs -r perl -i -lpe 's|	|        |g; s| +$$||g'

metrics:
	@gnat metric -P $(PROJECT)

$(HG_STATE_SOURCE): Makefile .hg/hgrc .hg/dirstate
	@echo 'package Mercurial is'                                 >  $(HG_STATE_SOURCE)
	@echo '   Revision : constant String (1 .. 53) :='           >> $(HG_STATE_SOURCE)
	@echo '                "'$(HG_REVISION)' '$(HG_MODIFIER)'";' >> $(HG_STATE_SOURCE)
	@echo 'end Mercurial;'                                       >> $(HG_STATE_SOURCE)

-include Makefile.project_rules

.PHONY: all build test install clean distclean fix-whitespace metrics
