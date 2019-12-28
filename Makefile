TREASURE_HUNT_ITEMS=treasure-hunt/index.html treasure-hunt/treasure-hunt.css treasure-hunt/locations/cb.html $(addprefix treasure-hunt/badges/, $(addsuffix .png, $(notdir $(basename $(wildcard src/treasure-hunt/badges/*.png))))) $(addprefix treasure-hunt/regions/, $(addsuffix .png, $(notdir $(basename $(wildcard src/treasure-hunt/regions/*.png))))) $(addprefix treasure-hunt/locations/, $(addsuffix .html, $(notdir $(basename $(wildcard src/treasure-hunt/locations/*.md)))))
BLOG_ITEMS=blog $(addprefix blog/, $(addsuffix .html, $(notdir $(basename $(wildcard src/blog/*.md)))))
EVERY_ITEMS=every.html every.css every/figs/people.png

all: index.html styles.css ${TREASURE_HUNT_ITEMS} $(BLOG_ITEMS) $(EVERY_ITEMS)

index.html: src/home.html src/include/header.html src/include/footer.html
	cat src/include/header.html src/home.html src/include/footer.html >index.html

styles.css: src/styles.css
	cp src/styles.css styles.css

every.html: src/every/every.md
	pandoc src/every/every.md -o every.html -s --template src/every/every.template.html

every.css: src/every/every.css
	cp src/every/every.css .

every:
	mkdir every

every/figs: every
	mkdir every/figs

every/figs/%.png: src/every/data/people.csv src/every/figures.py every/figs
	cd src/every/; . env/bin/activate; python figures.py
	cp src/every/figs/* every/figs

blog:
	mkdir blog

blog/%.html: src/blog/%.md src/blog-template.html
	cat src/include/header.html $< src/include/footer.html | \
		pandoc -o blog/$(notdir $(basename $<)).html -s --template src/blog-template.html

blog/%.html: src/blog/%.html src/blog-template.html
	cat src/include/header.html $< src/include/footer.html >blog/$(notdir $(basename $<)).html

treasure-hunt:
	mkdir -p treasure-hunt

treasure-hunt/index.html: src/treasure-hunt/index.md treasure-hunt
	pandoc src/treasure-hunt/index.md -o treasure-hunt/index.html -s

treasure-hunt/regions: treasure-hunt
	mkdir -p treasure-hunt/regions

treasure-hunt/badges: treasure-hunt
	mkdir -p treasure-hunt/badges

treasure-hunt/locations: treasure-hunt
	mkdir -p treasure-hunt/locations

treasure-hunt/treasure-hunt.css: src/treasure-hunt/treasure-hunt.css treasure-hunt
	cp src/treasure-hunt/treasure-hunt.css treasure-hunt/treasure-hunt.css

treasure-hunt/regions/%.png: src/treasure-hunt/regions/%.png treasure-hunt/regions
	cp $< treasure-hunt/regions/$(notdir $<)

treasure-hunt/badges/%.png: src/treasure-hunt/badges/%.png treasure-hunt/badges
	cp $< treasure-hunt/badges/$(notdir $<)

treasure-hunt/locations/cb.html: src/treasure-hunt/locations/cb.html treasure-hunt/locations
	cp src/treasure-hunt/locations/cb.html treasure-hunt/locations

treasure-hunt/locations/%.html: src/treasure-hunt/locations/%.md src/treasure-hunt/location.template.html treasure-hunt/locations
	pandoc $< -o treasure-hunt/locations/$(notdir $(basename $<)).html -s --template src/treasure-hunt/location.template.html
