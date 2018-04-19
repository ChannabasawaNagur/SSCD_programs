%{
  #include<stdio.h>
  int p,s;
%}

%%

"printf"  {p++;fprintf(yyout,"writef");}
"scanf"   {s++;fprintf(yyout,"readf");}

%%

int yywrap()
{
  return 1;
}

int main()
{
  yyin=fopen("in5.c","r");
  yyout=fopen("out5.c","w");
  yylex();
  printf("No. of printf :%d\nNo.of scanf :%d\n",p,s);
  return 1;
}
