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
%token MINUS UNDERSCORE TEXT

%%

// Why don't the midline and underline rule reduce?

accept:
	| accept phrase
	;

phrase:
	  text
	| phrase text
	;

text:
	  literal
	| formatted
	;

literal: TEXT ;

formatted:
	  midline
	| underline
	;

midline: MINUS phrase MINUS ;

underline: UNDERSCORE phrase UNDERSCORE ;

%%

int main() {
	yydebug = 1;
	yyparse();
	return 0;
}
