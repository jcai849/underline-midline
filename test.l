%{
#define YYSTYPE char *
#include "y.tab.h"
%}

%option nounput
%option noinput
%option noyywrap

%%

"-"     { yylval = "-"; return MINUS; }
"_"     { yylval = "_"; return UNDERSCORE; }
[^-_]+  { yylval = strdup(yytext); return TEXT; }

%%
