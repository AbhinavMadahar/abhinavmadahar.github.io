SRC=src
BLOG_SRC=blog # subdirectory of SRC

all: index.html blog blog/%.html 

index.html: $(SRC)/homepage.html
	cp $(SRC)/homepage.html index.html

blog:
	mkdir blog

blog/%.html:
	ls $(SRC)/$(BLOG_SRC) -1 | awk '{print "src/blog/"$$0}' | ./process-blog-post
