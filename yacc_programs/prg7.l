%{
  #include"y.tab.h"
  extern int yylval;
%}

%%
[ \t\n] ;
"int" return INT;
"float" return FLOAT;
"double" return DOUBLE;
"char" return CHAR;
[0-9]+ return DIG;
[a-zA-Z] return ALP;
[_] return UDRSCR;
. return yytext[0];

%%

int yywrap()
{

return 1;
}
