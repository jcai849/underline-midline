%{
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE char *

void yyerror(const char *s) {
	printf("Error: %s\n", s);
	exit(1);
}

int yylex(void);
%}

%printer { fprintf (yyo, "\"%s\"", $$); } TEXT MINUS UNDERSCORE 
%define parse.trace
%token TEXT MINUS UNDERSCORE
%nonassoc TEXT MINUS UNDERSCORE
%nonassoc REDUCE

%%

accept:
	| accept text %prec REDUCE
	;

text:
	  textual_element
	| text textual_element
	;

textual_element:
	  TEXT
	| midline
	| underline
	;

midline: MINUS text MINUS %prec REDUCE ;

underline: UNDERSCORE text UNDERSCORE %prec REDUCE ;

%%

int main() {
	yydebug = 1;
	yyparse();
	return 0;
}
