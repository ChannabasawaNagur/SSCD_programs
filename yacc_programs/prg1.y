%{
  #include<stdio.h>
  #include<stdlib.h>

  extern int yyerror();
  extern int yylex();

%}

%token num
%left '+' '-'
%left '*' '/'

%%

S : E {printf("the result is:%d\n",$$);}
  ;

E : E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;}
  | E '/' E {if($3!=0)$$=$1/$3;else return yyerror();}
  | '('E')' {$$=$2;}
  | num     {$$=$1;}
  ;
%%

int yyerror()
{
  printf("Invalid I/P\n");
  exit(0);
}

int main()
{
  printf("enter the expression:");
  yyparse();
  return 0;
}
