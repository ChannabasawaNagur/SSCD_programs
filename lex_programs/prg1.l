%{
  #include<stdio.h>
  int v=0,c=0;
%}
%%
[aeiou] {v++;}
[a-z] {c++;}
\n return 0;
%%

int yywrap()
{
return 1;
}

void main()
{
  printf("enter the string:\n");
  yylex();
  printf("No. of vowels are:%d\n",v);
  printf("No. of consonants are:%d\n",c);
  return ;
}
