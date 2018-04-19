%{
  #include<stdio.h>
  #include<stdlib.h>
  extern int yyerror();
  extern int yylex();
  extern FILE *yyin;
  int cnt;
%}

%token IF ID LEQ LT GT GEQ EQ EQQU DIG NOT

%%

T : S
  ;
S : IF '(' E ')' DEF {cnt++;}
  ;
DEF : '{' BODY '}'
    | S
    | E ';'
    |
    ;
BODY: BODY BODY
    | S
    | E ';'
    |
    ;
E : ID EQ DIG
  | ID EQQU DIG
  | ID EQQU ID
  | ID EQ ID
  | ID LT DIG
  | ID LEQ DIG
  | ID GT DIG
  | ID GEQ  DIG
  | ID LT ID
  | ID LEQ ID
  | ID GT ID
  | ID GEQ ID
  | ID NOT ID
  | ID NOT DIG
  ;

%%

int yyerror()
{
  printf("invalid i/p\n");
  exit(0);
}

int main()
{
  yyin=fopen("in6.c","r");
  yyparse();
  printf("No. of if's:%d\n",cnt);
  return 0;
}
