%{
#define YYSTYPE char *
#include "y.tab.h"
%}

%option nounput
%option noinput
%option noyywrap

%%
"-"     { yylval = strdup(yytext); return MINUS; }
"_"     { yylval = strdup(yytext); return UNDERSCORE; }
[^-_]+  { yylval = strdup(yytext); return TEXT; }
%%
