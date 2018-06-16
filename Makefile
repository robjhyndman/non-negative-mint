# Usually, only these lines need changing
TEXFILE= nonnegativemint

all: $(TEXFILE).pdf

# Compile main tex file
$(TEXFILE).pdf: $(TEXFILE).tex
	latexmk -pdf -quiet -f -pdflatex="pdflatex -synctex=1 -interaction=nonstopmode" -use-make	 $(TEXFILE)

# View main tex file
view: $(TEXFILE).pdf
	evince $(TEXFILE).pdf &

# Clean up stray files
clean:
	latexmk -c
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz *.out *.bcf *blx.bib *.run.xml
	rm -fv *.fdb_latexmk *.fls
	rm -fv $(TEXFILE).pdf

.PHONY: all clean

