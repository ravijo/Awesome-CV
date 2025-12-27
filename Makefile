CC = xelatex
BIB = biber
EXAMPLES_DIR = examples
DRAFT_DIR = examples/draft

# Find all CV source files
CV_SRCS = $(shell find $(EXAMPLES_DIR)/cv* -name '*.tex')

# Output PDFs
CV_PDFS = cv.pdf cv-jp.pdf
COVER_LETTER_PDFS = coverletter.pdf coverletter-jp.pdf
ALL_PDFS = $(CV_PDFS) $(COVER_LETTER_PDFS)

.PHONY: all examples clean draft draft-clean

# Build both examples and draft (if present)
all: examples draft clean draft-clean

examples: $(ALL_PDFS)

# CV documents (need bibliography compilation)
$(CV_PDFS): %.pdf: $(EXAMPLES_DIR)/%.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	$(BIB) $(EXAMPLES_DIR)/$*
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

# Cover letters (simple compilation)
$(COVER_LETTER_PDFS): %.pdf: $(EXAMPLES_DIR)/%.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	@for ext in aux bbl bcf blg log out run.xml; do \
		rm -f $(EXAMPLES_DIR)/*.$${ext}; \
	done

# Draft targets (only if draft directory exists)
draft:
	@if [ -d $(DRAFT_DIR) ] && [ -f $(DRAFT_DIR)/Makefile ]; then \
		$(MAKE) -C $(DRAFT_DIR); \
	fi

draft-clean:
	@if [ -d $(DRAFT_DIR) ] && [ -f $(DRAFT_DIR)/Makefile ]; then \
		$(MAKE) -C $(DRAFT_DIR) clean; \
	fi