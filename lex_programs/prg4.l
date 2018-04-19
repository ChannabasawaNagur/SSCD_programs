%{
  #include<stdio.h>
  int c;
%}

%%

"//"(.)*"\n" {c++;fprintf(yyout,"");}
"/*"(.|"\n")*"*/" {c++;fprintf(yyout,"");}
"end" {fprintf(yyout,"");return 0;}

%%

int yywrap()
{
return 1;
}

int main()
{
  yyin=fopen("input.c","r");
  yyout=fopen("output.c","w");
  yylex();
  printf("No.of comment lines are:%d",c);
}
