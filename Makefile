SRC=src
BLOG_SRC=src/blog

all: index.html blog blog/%.html 

index.html: $(SRC)/homepage.html
	cp $(SRC)/homepage.html index.html

blog:
	mkdir blog

blog/%.html:
	ls $(BLOG_SRC) -1 | awk '{print "src/blog/"$$1}' | ./process-blog-post
