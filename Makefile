SRC=src
BLOG_SRC=blog# subdirectory of SRC
BLOG_DEST=blog# subdirectory of repo

all: index.html $(BLOG_DEST) blog/%.html styles.css hill323.html

index.html: $(SRC)/home.html $(SRC)/include/header.html $(SRC)/include/footer.html
	@cat $(SRC)/home.html | m4 > index.html

$(BLOG_DEST):
	@mkdir $(BLOG_DEST)

$(BLOG_DEST)/%.html: $(SRC)/$(BLOG_SRC)/*.html
	@echo $(SRC)/$(BLOG_SRC)/*.html | \
		sed 's/\ /\n/g' | \
		./process-blog-post

styles.css: $(SRC)/styles.css
	@cp $(SRC)/styles.css styles.css

hill323.html: $(SRC)/hill323.html
	cp $(SRC)/hill323.html .
