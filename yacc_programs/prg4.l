%{
  #include"y.tab.h";
  extern int yylval;
%}

%%
[0-9]+  {return num;}
. return yytext[0];
\n return 0;
%%
