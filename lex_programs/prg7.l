%{
  #include<stdio.h>
  #include<string.h>
  char find[100];
  char replace[100];
%}

%%

[a-zA-Z0-9]+  {if(!strcmp(find,yytext))
                  fprintf(yyout,"%s",replace);
                else
                  fprintf(yyout,"%s",yytext);}
.        {fprintf(yyout,yytext);}

%%

int yywrap()
{
  return 1;
}

int main()
{

  yyin = fopen("in7.c","r");
  yyout=fopen("out7.c","w");
  printf("enter the word to find:");
  scanf("%s",find);
  printf("enter the word to replace:");
  scanf("%s",replace);
  yylex();
}
