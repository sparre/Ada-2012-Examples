include Makefile.project
-include .config

LC_PROJECT = $(shell echo -n "${PROJECT}" | tr '[:upper:].' '[:lower:]-')

PROJECT_ROOT_SOURCE = src/$(LC_PROJECT).ads
GENERATED_SOURCES  += $(PROJECT_ROOT_SOURCE)

HG_STATE_SOURCE     = src/$(LC_PROJECT)-mercurial.ads
HG_MODIFIER         = `test $$(hg status | wc -c) -gt 0 && echo "plus changes" || echo "as committed"`
HG_REVISION         = `hg tip --template '{node}' 2>/dev/null || echo N/A`
GENERATED_SOURCES  += $(HG_STATE_SOURCE)

PROJECT_DEMO_SOURCE = src/$(LC_PROJECT)-demo.adb
GENERATED_SOURCES  += $(PROJECT_DEMO_SOURCE)

EXECUTABLES=$(GENERATED_EXECUTABLES) $(SCRIPTS)

PREFIX ?= $(HOME)

PROCESSORS ?= `(test -f /proc/cpuinfo && grep -c ^processor /proc/cpuinfo) || echo 1`

REPOSITORY_STATE  = .hg/dirstate
REPOSITORY_CONFIG = .hg/hgrc

all: build metrics

build: build-depends fix-whitespace $(GENERATED_SOURCES)
	gnatmake -j$(PROCESSORS) -p -P $(LC_PROJECT)

test: build metrics $(EXECUTABLES)
	@mkdir -p tests/results
	@./tests/build
	@./tests/run

install: build test
	@strip $(GENERATED_EXECUTABLES)
	install -D -t $(DESTDIR)$(PREFIX)/bin/ $(EXECUTABLES)

clean:
	find . \( -name "*~" -o -name "*.bak" -o -name "*.o" -o -name "*.ali" -o -name "*.adt" \) -type f -print0 | xargs -0 /bin/rm || true
	if [ ! -z "$(GENERATED_SOURCES)" ]; then rm -f $(GENERATED_SOURCES) 2>/dev/null || true; fi
	if [ ! -z "$(TEST_OUTPUT)"       ]; then rm -f $(TEST_OUTPUT)       2>/dev/null || true; fi
	rmdir bin || true
	rmdir obj || true

distclean: clean
	if [ ! -z "$(GENERATED_SOURCES)" ]; then rm -rf $(GENERATED_SOURCES); fi
	if [ ! -z "$(TEST_OUTPUT)" ];       then rm -rf $(TEST_OUTPUT);       fi
	gnatclean -P $(LC_PROJECT) || true
	rm -f $(GENERATED_EXECUTABLES)
	rm -f obj/*.ad[sb].metrix
	rmdir bin || true
	rmdir obj || true

build-depends:
	@for command in $$(cat .build-depends.commands) ; do if [ ! -x "$$(which $${command})" ]; then echo "'$${command}' not found."; exit 1; fi; done
	@for project in $$(cat .build-depends.projects) ; do project_file="$$(gnatls -v | egrep '^   [^ ]' | sort -u | while read directory ; do ls "$${directory}/$${project}.gpr" 2>/dev/null; done)" ; if [ -z "$${project_file}" -o ! -s "$${project_file}" ]; then echo "'$${project}.gpr' not found."; exit 1; fi; done

fix-whitespace:
	@find src tests -name '*.ad?' | xargs egrep -l '	| $$' | grep -v '^b[~]' | xargs perl -i -lpe 's|	|        |g; s| +$$||g' 2>/dev/null || true

metrics:
	@gnat metric -j$(PROCESSORS) -P $(LC_PROJECT)

$(REPOSITORY_CONFIG):
	@mkdir -p $(shell dirname $(REPOSITORY_CONFIG))
	@touch $(REPOSITORY_CONFIG)

$(REPOSITORY_STATE):
	@mkdir -p $(shell dirname $(REPOSITORY_STATE))
	@touch $(REPOSITORY_STATE)

$(PROJECT_ROOT_SOURCE): Makefile
	@mkdir -p src
	@echo 'package '$(PROJECT)' with Pure is' >  $(PROJECT_ROOT_SOURCE)
	@echo 'end '$(PROJECT)';'                 >> $(PROJECT_ROOT_SOURCE)

$(HG_STATE_SOURCE): Makefile $(REPOSITORY_CONFIG) $(REPOSITORY_STATE) $(PROJECT_ROOT_SOURCE)
	@mkdir -p src
	@echo 'package '$(PROJECT)'.Mercurial is'                    >  $(HG_STATE_SOURCE)
	@echo '   Revision : constant String (1 .. 53) :='           >> $(HG_STATE_SOURCE)
	@echo '                "'$(HG_REVISION)' '$(HG_MODIFIER)'";' >> $(HG_STATE_SOURCE)
	@echo 'end '$(PROJECT)'.Mercurial;'                          >> $(HG_STATE_SOURCE)

$(PROJECT_DEMO_SOURCE): Makefile $(PROJECT_ROOT_SOURCE) $(HG_STATE_SOURCE)
	@mkdir -p src
	@echo 'with Ada.Text_IO;'                                            >  $(PROJECT_DEMO_SOURCE)
	@echo                                                                >> $(PROJECT_DEMO_SOURCE)
	@echo 'with '$(PROJECT)'.Mercurial;'                                 >> $(PROJECT_DEMO_SOURCE)
	@echo                                                                >> $(PROJECT_DEMO_SOURCE)
	@echo 'procedure '$(PROJECT)'.Demo is'                               >> $(PROJECT_DEMO_SOURCE)
	@echo 'begin'                                                        >> $(PROJECT_DEMO_SOURCE)
	@echo '   Ada.Text_IO.Put_Line ("Revision: " & Mercurial.Revision);' >> $(PROJECT_DEMO_SOURCE)
	@echo 'end '$(PROJECT)'.Demo;'                                       >> $(PROJECT_DEMO_SOURCE)

-include Makefile.project_rules

.PHONY: all build test install clean distclean build-depends fix-whitespace metrics

