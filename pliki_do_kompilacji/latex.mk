# Wspólne reguły dla katalogów źródeł i katalogów zbiorczych.
.DEFAULT_GOAL := default
.DELETE_ON_ERROR:
# Konwersje SVG używają wspólnego katalogu cache także przy make -j.
.NOTPARALLEL:

LATEX ?= pdflatex
PDFJAM ?= pdfjam
LATEX_FLAGS := --shell-escape -interaction=nonstopmode -halt-on-error -file-line-error
GRAPHICS_PATH := $(COMPILE_PATH)/
# Końcowy dwukropek zachowuje standardowe ścieżki wyszukiwania TeX-a.
export TEXINPUTS := $(COMPILE_PATH)//:$(TEXINPUTS):

# Pliki z \input bez własnej klasy są zależnościami, nie osobnymi dokumentami.
TEX_FILES := $(sort $(shell grep -l '^[[:space:]]*\\documentclass' *.tex 2>/dev/null))
PDF_FILES := $(TEX_FILES:.tex=.pdf)
SOL_PDF_FILES := $(TEX_FILES:.tex=_sol.pdf)
DUP_PDF_FILES := $(TEX_FILES:.tex=_duplicated.pdf)
# Dodatkowe warianty zadeklarowane przez lokalny Makefile.
EXTRA_PDF_FILES ?=

# Zmiana klasy, zasobu albo lokalnego fragmentu wymusza przebudowę.
# Pomijamy PDF-y wygenerowane z sąsiednich źródeł i cache pakietu svg.
LOCAL_TEX := $(shell find . -type f -name '*.tex' ! -path '*/svg-inkscape/*')
LOCAL_INPUTS := $(filter-out $(LOCAL_TEX:.tex=.pdf) $(LOCAL_TEX:.tex=_sol.pdf) $(LOCAL_TEX:.tex=_duplicated.pdf) $(addprefix ./,$(EXTRA_PDF_FILES)),$(shell find . -type f \( -name '*.tex' -o -name '*.cls' -o -name '*.sty' -o -name '*.bib' -o -name '*.svg' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.eps' -o -name '*.pdf' \) ! -path '*/svg-inkscape/*'))
SHARED_INPUTS := $(shell find $(COMPILE_PATH) -type f ! -path '*/svg-inkscape/*')
BUILD_INPUTS := $(LOCAL_INPUTS) $(SHARED_INPUTS) Makefile

.PHONY: default participant all sol duplicate clean clean-pdf FORCE $(SUBDIRS)

default: participant
participant: $(PDF_FILES)
all: $(PDF_FILES) $(SOL_PDF_FILES)
sol: $(SOL_PDF_FILES)
duplicate: $(DUP_PDF_FILES)

$(SUBDIRS):
	+$(MAKE) -C "$@"

participant all sol duplicate:
	+@set -e; for dir in $(SUBDIRS); do $(MAKE) -C "$$dir" "$@"; done

$(PDF_FILES): %.pdf: %.tex $(BUILD_INPUTS)
	$(LATEX) $(LATEX_FLAGS) -jobname="$(basename $@)" '\def\GRAPHICS{$(GRAPHICS_PATH)}\input{$<}'
	$(LATEX) $(LATEX_FLAGS) -jobname="$(basename $@)" '\def\GRAPHICS{$(GRAPHICS_PATH)}\input{$<}'

$(SOL_PDF_FILES): %_sol.pdf: %.tex $(BUILD_INPUTS)
	$(LATEX) $(LATEX_FLAGS) -jobname="$(basename $@)" '\def\GRAPHICS{$(GRAPHICS_PATH)}\def\WithSolutions{}\input{$<}'
	$(LATEX) $(LATEX_FLAGS) -jobname="$(basename $@)" '\def\GRAPHICS{$(GRAPHICS_PATH)}\def\WithSolutions{}\input{$<}'

# Każda strona dwukrotnie obok siebie: 2 x A5 na poziomym arkuszu A4.
# duplicatepages zachowuje pary (1,1), (2,2), ... także dla wielu stron.
$(DUP_PDF_FILES): %_duplicated.pdf: %.pdf $(COMPILE_PATH)/latex.mk Makefile
	$(PDFJAM) "$<" --duplicatepages 2 --nup 2x1 --a4paper --landscape --outfile "$@"

# Przykład z głównego katalogu: make kontesty/juniorzy/juniorzy_d1_sol.pdf.
# FORCE pozwala sprawdzić zależności także wtedy, gdy wskazany PDF już istnieje.
%.pdf: FORCE
	+@case "$@" in */*) $(MAKE) -C "$(dir $@)" "$(notdir $@)" ;; *) echo "Brak źródła dla $@" >&2; exit 2 ;; esac

FORCE:

clean clean-pdf:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.w18
	find . -type d -name svg-inkscape -prune -exec rm -rf {} +
	@if [ "$@" = clean-pdf ]; then rm -f $(PDF_FILES) $(SOL_PDF_FILES) $(DUP_PDF_FILES) $(EXTRA_PDF_FILES); fi
	+@set -e; for dir in $(SUBDIRS); do $(MAKE) -C "$$dir" "$@"; done
