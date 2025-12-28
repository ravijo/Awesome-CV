# ===========================
# Configuration
# ===========================
CC  := xelatex
BIB := biber

EXAMPLES_DIR := examples
DRAFT_DIR    := examples/draft

# ===========================
# File lists (derived from base names)
# ===========================
# CV base names - each has: name.tex, name/ folder, name.pdf (output)
CV_NAMES := cv cv-jp

# Cover letter base names
COVER_NAMES := coverletter coverletter-jp

# Temporary file extensions to clean
TEMP_EXTS := aux bbl bcf blg log out run.xml

# Derived file lists
CV_PDFS    := $(addsuffix .pdf, $(CV_NAMES))
COVER_PDFS := $(addsuffix .pdf, $(COVER_NAMES))
ALL_PDFS   := $(CV_PDFS) $(COVER_PDFS)

# ===========================
# Phony targets
# ===========================
.PHONY: all examples clean draft draft-clean

# ===========================
# Default target
# ===========================
all: examples draft clean draft-clean

examples: $(ALL_PDFS)

# ===========================
# Build rules
# ===========================
# CV PDFs require biber for bibliography processing
# Each CV only depends on files in its own directory
$(CV_PDFS): %.pdf: $(EXAMPLES_DIR)/%.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	$(BIB) $(EXAMPLES_DIR)/$*
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

# Cover letters are simpler - single pass
$(COVER_PDFS): %.pdf: $(EXAMPLES_DIR)/%.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

# ===========================
# Cleanup
# ===========================
clean:
	@rm -f $(addprefix $(EXAMPLES_DIR)/*., $(TEMP_EXTS))

# ===========================
# Draft targets (only if draft directory exists)
# ===========================
draft:
	@if [ -d $(DRAFT_DIR) ] && [ -f $(DRAFT_DIR)/Makefile ]; then \
		$(MAKE) -C $(DRAFT_DIR); \
	fi

draft-clean:
	@if [ -d $(DRAFT_DIR) ] && [ -f $(DRAFT_DIR)/Makefile ]; then \
		$(MAKE) -C $(DRAFT_DIR) clean; \
	fi