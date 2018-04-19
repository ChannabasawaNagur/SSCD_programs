%{
  #include<stdio.h>
  int w=0;
  int l=0;
  int c=0;
%}

%%

[a-zA-Z]+ {w++;c+=yyleng;}
\n {l++;}
@ {l++;return 0;}
. {c++;}

%%

int yywrap()
{
return 1;
}

int main()
{
  printf("enter the string:");
  yylex();
  printf("No. of characters:%d\n",c++);
  printf("No. of words:%d\n",w++);
  printf("No. of lines:%d\n",l++);
  return 0;
}
