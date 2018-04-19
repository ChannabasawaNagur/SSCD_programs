%{
  #include"y.tab.h"
  extern int yylval;
%}

%%
[ \t\n] ;
"if" return IF;
[a-zA-Z_]+ return ID;
[0-9]+ return DIG;
"=" return EQ;
"==" return EQQU;
"<"   return LT;
"<=" return LEQ;
">"   return GT;
">="  return GEQ;
"!" return NOT;
. return yytext[0];

%%
