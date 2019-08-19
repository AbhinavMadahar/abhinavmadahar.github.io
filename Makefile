TREASURE_HUNT_ITEMS=treasure-hunt treasure-hunt/treasure-hunt.css $(addprefix treasure-hunt/locations/, $(addsuffix .html, $(notdir $(basename $(wildcard src/treasure-hunt/locations/*.md)))))
BLOG_ITEMS=blog $(addprefix blog/, $(addsuffix .html, $(notdir $(basename $(wildcard src/blog/*.md)))))

all: index.html styles.css ${TREASURE_HUNT_ITEMS} $(BLOG_ITEMS)

index.html: src/home.html src/include/header.html src/include/footer.html
	cat src/include/header.html src/home.html src/include/footer.html >index.html

styles.css: src/styles.css
	cp src/styles.css styles.css

blog:
	mkdir blog

blog/%.html: src/blog/%.md src/blog-template.html
	cat src/include/header.html $< src/include/footer.html | \
		pandoc -o blog/$(notdir $(basename $<)).html -s --template src/blog-template.html

treasure-hunt:
	mkdir -p treasure-hunt
	mkdir -p treasure-hunt/locations

treasure-hunt/treasure-hunt.css: src/treasure-hunt/treasure-hunt.css
	cp src/treasure-hunt/treasure-hunt.css treasure-hunt/treasure-hunt.css

treasure-hunt/locations/%.html: src/treasure-hunt/locations/%.md src/treasure-hunt/location.template.html
	cat $< | \
		pandoc -o treasure-hunt/$(notdir $(basename $<)).html -s --template src/treasure-hunt/location.template.html
