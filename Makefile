all: index.html appazonooglebook appazonooglebook.html styles.css $(addprefix blog/, $(addsuffix .html, $(notdir $(basename $(wildcard src/blog/*.md)))))

index.html: src/home.html src/include/header.html src/include/footer.html
	cat src/include/header.html src/home.html src/include/footer.html >index.html

appazonooglebook.html: src/appazonooglebook.html
	cp src/appazonooglebook.html appazonooglebook.html

appazonooglebook: src/apple.html
	mkdir -p appazonooglebook
	cp src/apple.html appazonooglebook/apple.html

styles.css: src/styles.css
	cp src/styles.css styles.css

blog/%.html: src/blog/%.md
	cat src/include/header.html $< src/include/footer.html | \
		pandoc -o blog/$(notdir $(basename $<)).html -s --template blog-template.html
