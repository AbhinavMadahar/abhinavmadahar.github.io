all: index.html styles.css $(addprefix blog/, $(addsuffix .html, $(notdir $(basename $(wildcard src/blog/*.md)))))

index.html: src/home.html src/include/header.html src/include/footer.html
	cat src/include/header.html src/home.html src/include/footer.html >index.html

styles.css: src/styles.css
	cp src/styles.css styles.css

blog/%.html: src/blog/%.md
	cat src/include/header.html $< | pandoc -o blog/$(notdir $(basename $<)).html -s --template blog-template.html
