SRC=src
BLOG_SRC=blog # subdirectory of SRC

all: index.html blog blog/%.html styles.css

index.html: $(SRC)/homepage.html $(SRC)/header.html
	cat $(SRC)/homepage.html | cpp -xc - | grep -v '^#' > index.html

blog:
	mkdir blog

blog/%.html: blog
	ls $(SRC)/$(BLOG_SRC) -1 | awk '{print "src/blog/"$$0}' | ./process-blog-post

styles.css: $(SRC)/styles.css
	cp $(SRC)/styles.css styles.css
