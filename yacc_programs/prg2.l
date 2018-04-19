%{
  #include"y.tab.h"
  extern int yylval;
%}

%%

"a" {return A;}
"b" {return B;}
"c" {return C;}
.   return yytext[0];
\n  {return 0;}
%%

int yywrap()
{
return 1;
}
