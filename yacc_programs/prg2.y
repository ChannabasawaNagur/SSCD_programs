%{
  #include<stdio.h>
  #include<stdlib.h>

  extern int yyerror();
  extern int yylex();
%}

%token A B C

%%

T : S
  ;

S : X Y
  |
  ;

X : A X B
  |
  ;

Y : B Y C
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
  printf("enter the string");
  yyparse();
  {printf("String Accepted\n");}
  return 0;
}
