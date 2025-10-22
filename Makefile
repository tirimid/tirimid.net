.PHONY: all clean

CMF_FILES := $(shell find cmf -type f -name "*.cmf")
HTML_FILES := $(patsubst cmf/%.cmf,html/%.html,$(CMF_FILES))

BASE_STYLE := plain-light
TIRIMID_STYLE := plain-light
CHETRUCHMY_STYLE := plain-light

all: $(HTML_FILES)
	cp -r html/* .
	rm -rf html

clean:
	rm -rf tirimid chetruchmy 404.html index.html

html/tirimid/%.html: cmf/tirimid/%.cmf
	@ mkdir -p $@
	@ rmdir $@
	cmfc -o $@ -s styles/$(TIRIMID_STYLE).css -d docdata/tirimid.cmf $<

html/chetruchmy/%.html: cmf/chetruchmy/%.cmf
	@ mkdir -p $@
	@ rmdir $@
	cmfc -o $@ -s styles/$(CHETRUCHMY_STYLE).css -d docdata/chetruchmy.cmf $<

html/%.html: cmf/%.cmf
	@ mkdir -p $@
	@ rmdir $@
	cmfc -o $@ -s styles/$(BASE_STYLE).css $<
