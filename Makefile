.PHONY: examples clean

CC = xelatex
BIB = biber
EXAMPLES_DIR = examples
CV_DIR = examples/cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

all: examples clean

examples: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	$(BIB) $(EXAMPLES_DIR)/cv
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	@for ext in aux bbl bcf blg log out run.xml; do \
		rm -rf $(EXAMPLES_DIR)/*.$${ext}; \
	done
