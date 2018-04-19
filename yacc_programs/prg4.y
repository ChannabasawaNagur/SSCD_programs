%{
  #include<stdio.h>
  #include<stdlib.h>
  extern int yyerror();
  extern int yylex();
%}

%token num

%%

S : E
  ;

E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  |'('E')'
  |num
  ;

%%

int yyerror()
{
  printf("invalid expression\n");
  exit(0);
}

int main()
{
  printf("enter the string\n");
  yyparse();
  printf("Valid string\n");
  return 0;
}
