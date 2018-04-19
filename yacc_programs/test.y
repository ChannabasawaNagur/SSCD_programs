%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
extern int yyerror();
%}


%token A B C

%%

T : S   {printf("\nInput accepted!!\n");}
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
int yyerror(){
printf("Invalid input!!");
exit(0);
}
int main(){
printf("Enter input: ");
yyparse();
return 0;
}
