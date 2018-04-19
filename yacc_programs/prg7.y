%{
  #include<stdio.h>
  #include<stdlib.h>
  extern int yyerror();
  extern int yylex();
  extern FILE * yyin;
  int cnt;
%}

%token INT FLOAT DOUBLE CHAR UDRSCR DIG ALP

%%

S : ID
  ;
ID: KEY IDENT ';' ID
  |
  ;
IDENT : VAR ',' IDENT {cnt++;}
      | VAR {cnt++;}
      |
      ;
KEY : INT
    | FLOAT
    | CHAR
    | DOUBLE
    ;
VAR : ALP E
    | UDRSCR E
    ;
E : E E
  | DIG
  | ALP
  | UDRSCR
  |
  ;
%%

int yyerror()
{
  printf("invalid i/p\n");
  exit(0);
}

int main()
{
  yyin = fopen("in7.c","r");
  yyparse();
  printf("No. of variables:%d\n",cnt);
  return 0;
}
