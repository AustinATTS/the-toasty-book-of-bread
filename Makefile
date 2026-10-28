TEXFLAGS = -no-pdf -interaction=nonstopmode -halt-on-error
EXCERPT_ART = \
	art/redrawn/iconArepa.png art/redrawn/iconBagel.png \
	art/redrawn/iconBug.png art/redrawn/iconCarasau.png \
	art/redrawn/iconCoco.png art/redrawn/iconFocaccia.png \
	art/redrawn/iconFtira.png art/redrawn/iconInjera.png \
	art/redrawn/iconKnack.png art/redrawn/iconObwarzanek.png \
	art/redrawn/iconPita.png art/redrawn/iconRugbrod.png
EXCERPT_SOURCES = connections-excerpt.tex panetteria.sty \
	excerpt/chapters/71-connections-opening.tex \
	excerpt/chapters/72-connection-neighbours.tex \
	excerpt/chapters/73-connection-sheets.tex \
	excerpt/chapters/74-connection-rings.tex \
	excerpt/chapters/75-connection-ferments.tex \
	excerpt/chapters/76-connection-keeping.tex \
	excerpt/chapters/77-connection-meals.tex \
	excerpt/connections-references.bib \
	art/bread-icons.tex art/connections.tex art/redrawn-assets.tex art/cc-by-sa.pdf \
	$(EXCERPT_ART)

.PHONY: excerpt clean
excerpt: $(EXCERPT_SOURCES)
	mkdir -p build/excerpt
	xelatex $(TEXFLAGS) -output-directory=build/excerpt connections-excerpt.tex
	bibtex build/excerpt/connections-excerpt
	xelatex $(TEXFLAGS) -output-directory=build/excerpt connections-excerpt.tex
	xelatex $(TEXFLAGS) -output-directory=build/excerpt connections-excerpt.tex
	xdvipdfmx -z 1 -o build/excerpt/connections-excerpt.pdf build/excerpt/connections-excerpt.xdv

clean:
	rm -f build/excerpt/*
