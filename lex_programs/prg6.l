%{
  #include<stdio.h>
  int i;
%}
types ("int"|"float"|"char"|"double"|"string"|"char")
alpha [a-zA-Z]
alnum [a-zA-Z0-9_]
%%
{types}[ ]{alpha}{alnum}*"("  {i++;}
{types}[ ]{alpha}{alnum}*";"  {i++;}
{types}[ ]{alpha}{alnum}*=[0-9]+[;]  {i++;}
{types}[ ]{alpha}{alnum}*,  {i++;}
{alpha}{alnum}*,  {i++;}
{alpha}{alnum}*;  {i++;}
. {}
"end" {return 0;}
%%

int yywrap()
{
  return 1;
}

int main()
{
  yyin=fopen("in6.c","r");
  yylex();
  printf("No. of identfiers:%d\n",i);
}
