%{
  #include "y.tab.h"
  extern int yylval;
%}

%%

[ \t\n] ;
[0-9]+ return DIG;
"<=" return LEQ;
">=" return GEQ;
">"   return GT;
"<"   return LT;
"for" return FOR ;
"++"  return INC;
"--" return DEC;
"=" return EQU;
[A-Za-z_] return ID;
. return yytext[0];

%%
