text=Dossier de location
date=20 août 2021

.PHONY: all
all: watermark

# hint : pour générer une date en français : LC_ALL=fr_FR.utf8 date '+%d %B %Y'
# hint n°2 : vérifier que la locale fr_FR.utf8 existe bien dans `locale -a`
watermark.tex: watermark.tex.tpl
	@cat watermark.tex.tpl | \
		TEXT="${text}" DATE="${date}" envsubst > watermark.tex

watermark.pdf: watermark.tex
	pdflatex watermark.tex

# the watermark target will also flatten the pdf to prevent it from being
# reversed and extrated without the watermark
watermark: watermark.pdf
	@([ "${input}" != "" ] && [ "${output}" != "" ]) \
		|| (echo "usage: make watermark input=i.pdf output=o.pdf" && exit 1)
	pdftk "${input}" stamp watermark.pdf output "${output}.noflat"
	convert -compress jpeg -quality 30 -density 300 "${output}.noflat" "${output}"
