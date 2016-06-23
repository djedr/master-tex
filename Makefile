THESIS = main
SRC_FILES = title_page 0_introduction 1_background 2_language 3_editor \
            4_case_study 5_design_discussion 6_summary a_dvd
STYLE = thesis.sty
BIBLIOGRAPHY = bibliography
OTHER_FILES = Makefile korekta.sh img/logo.pdf

.PHONY: all clean zip

all: $(THESIS).pdf

zip: $(THESIS).tar.gz

$(THESIS).pdf: $(THESIS).tex  $(SRC_FILES:%=%.tex) $(STYLE) $(THESIS).bbl
	pdflatex $(THESIS).tex
	pdflatex $(THESIS).tex

$(THESIS).bbl: $(BIBLIOGRAPHY).bib
	pdflatex $(THESIS).tex
	bibtex $(THESIS)

$(THESIS).tar.gz: $(THESIS).pdf
	tar czf $(THESIS).tar.gz $(THESIS).pdf $(THESIS).tex \
		$(SRC_FILES:%=%.tex) $(STYLE) $(BIBLIOGRAPHY).bib $(OTHER_FILES)

clean:
	rm -rf $(THESIS).aux
	rm -rf $(THESIS).bbl
	rm -rf $(THESIS).blg
	rm -rf $(THESIS).log
	rm -rf $(THESIS).out
	rm -rf $(THESIS).pdf
	rm -rf $(THESIS).toc
	rm -rf $(THESIS).tar.gz
	rm -rf texput.log
