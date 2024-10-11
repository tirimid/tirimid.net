.PHONY: all clean

CMF_DIR := cmf
HTML_DIR := html
CMFC := cmfc
STYLE_FILE := style.css

CMF_FILES := $(shell find $(CMF_DIR) -type f -name "*.cmf")
HTML_FILES := $(patsubst $(CMF_DIR)/%.cmf,$(HTML_DIR)/%.html,$(CMF_FILES))

all: $(HTML_FILES)

clean:
	rm -rf $(HTML_DIR)

$(HTML_DIR)/%.html: $(CMF_DIR)/%.cmf
	@ mkdir -p $@
	@ rmdir $@
	$(CMFC) -o $@ -s $(STYLE_FILE) $<
