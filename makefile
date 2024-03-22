all: parser #doc
	./parser <test.txt
parser: test.l test.y
	lex test.l
	yacc -d -x test.y
	gcc lex.yy.c y.tab.c -o parser
doc: parser
	xsltproc `bison --print-datadir`/xslt/xml2xhtml.xsl y.xml >y.html
clean:
	rm -rf y.xml
	rm -rf y.html
	rm -rf lex.yy.c
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf parser
	
