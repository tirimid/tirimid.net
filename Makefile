.PHONY: all

CMF_FILES := $(shell find cmf -type f -name "*.cmf")
HTML_FILES := $(patsubst cmf/%.cmf,html/%.html,$(CMF_FILES))

all: $(HTML_FILES)
	cp -r html/* .
	rm -rf html

html/tirimid/%.html: cmf/tirimid/%.cmf
	@ mkdir -p $@
	@ rmdir $@
	cmfc -o $@ -s style.css -d docdata/tirimid.cmf $<

html/%.html: cmf/%.cmf
	@ mkdir -p $@
	@ rmdir $@
	cmfc -o $@ -s style.css $<
