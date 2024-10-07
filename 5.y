%{
    #include <stdio.h>
    #include <stdlib.h>
    extern FILE* yyin;
    int count=0;
%}
%token TYPE ID NUM;
%%
S : I ;
I : E 
| E I ;
E : TYPE A B ';' ;
A: ID {count++;}
| ID '[' ']' {count++;}
| ID '['NUM']' {count++;}
;
B: ',' A B
|
;
%%
int main(){
    yyin=fopen("input.c","r");
    yyparse();
    printf("Dec:%d\n",count);
}
int yyerror(){
    printf("error");
    exit(1);
}
