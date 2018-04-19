%{
  #include<stdio.h>
  #include<stdlib.h>
  extern int yyerror();
  extern int yylex();
%}

%token A B

%%

T : S
  ;

S : X
  |
  ;

X : A X B
  |
  ;
%%
int yyerror()
{
  printf("invalid string\n");
  exit(0);
}

int main()
{
  printf("enter the string\n");
  yyparse();
  printf("string is accepted\n");
  return 0;
}
