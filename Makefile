pandoc := $(shell which pandoc)
citeproc := $(shell which pandoc-citeproc)

pdf: proposal.md references.bib metadata.yaml
	${pandoc} \
		-f markdown+smart \
		--variable documentclass=article \
		--filter=${citeproc} \
		--bibliography=references.bib \
		--csl=acm-sig-proceedings.csl \
		--pdf-engine=xelatex \
		metadata.yaml proposal.md \
		-o proposal.pdf \

docx: proposal.md references.bib metadata.yaml
	${pandoc} \
		-f markdown+smart \
		--filter=${citeproc} \
		--bibliography=references.bib \
		--csl=acm-sig-proceedings.csl \
		--reference-doc=custom-style.docx \
		metadata.yaml proposal.md \
		-o proposal.docx \
		
clean: 
	rm -f proposal.pdf proposal.docx