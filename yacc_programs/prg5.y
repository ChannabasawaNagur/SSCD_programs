%{
  #include<stdio.h>
  #include<stdlib.h>
  extern int yyerror();
  extern int yylex();
  int cnt ;
  extern FILE * yyin;
%}

%token FOR EQU LEQ GEQ LT GT DIG ID INC DEC

%%

T : S
  ;

S : FOR '('E ';' E ';' E  ')' DEF {cnt++;}
  ;

DEF : '{' BODY '}'
    | E';'
    | S
    |
    ;

BODY : BODY BODY
     | E ';'
     | S
     |
     ;

E : ID EQU DIG
  | ID LEQ DIG
  | ID LEQ ID
  | ID GEQ DIG
  | ID GEQ ID
  | ID GT DIG
  | ID GT ID
  | ID LT DIG
  | ID LT ID
  | ID INC
  | ID DEC
  ;
%%

int yyerror()
{
printf("error in input file\n");
exit(0);
}

int main()
{
  yyin=fopen("in5.c","r");
  yyparse();
  printf("No. of for loops:%d\n",cnt);
  return 0;
}
