MMARK := mmark
TXT := $(patsubst %.md,%.txt,$(wildcard *.md))
XML := $(patsubst %.md,%.xml,$(wildcard *.md))
HTML := $(patsubst %.md,%.html,$(wildcard *.md))
PDF := $(patsubst %.md,%.pdf,$(wildcard *.md))

txt: $(TXT)

%.txt: %.md
	$(MMARK) $< > $(basename $<).xml && xml2rfc --text --v3 $(basename $<).xml && rm $(basename $<).xml

html: $(HTML)

%.html: %.md
	$(MMARK) $< > $(basename $<).xml && xml2rfc --html --v3 $(basename $<).xml && rm $(basename $<).xml

xml: $(XML)

%.xml: %.md
	$(MMARK) $< > $(basename $<).xml

pdf: $(PDF)

%.pdf: %.md
	$(MMARK) $< > $(basename $<).xml && xml2rfc --pdf --v3 $(basename $<).xml && rm $(basename $<).xml

.PHONY: clean
clean:
	rm -f *.txt *.xml
