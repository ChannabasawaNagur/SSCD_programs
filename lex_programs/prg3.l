%{
  #include<stdio.h>
  int p,n,pf,nf;
%}

%%

[+]?[0-9]*[[/]][+]?[0-9]+ {pf++;}
[-][0-9]*[/][-][0-9]+ {pf++;}
[-][0-9]*[/][+]?[0-9]+  {nf++;}
[+]?[0-9]*[/][-]?[0-9]+ {nf++;}
[+]?[0-9]+.[0-9]+ {pf++;}
[-]?[0-9]+.[0-9]+ {nf++;}
[+]?[0-9]* {p++;}
[-][0-9]* {n++;}
. { }
\n  {printf("No. of positive integers:%d\n",p);
      printf("No. of negative integers:%d\n",n);
      printf("No. of positive fractions:%d\n",pf);
      printf("No. of negative fractions:%d\n",nf); p=0;n=0;pf=0;nf=0; }
(end) {return;}
%%

int yywrap()
{
  return 1;
}

void main()
{
  printf("enter the expression");
  yylex();
  return ;
}
