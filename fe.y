%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
void yyerror(const char *s);
%}

%token INC DEC MOVR MOVL OUT IN LB RB

%%

program:
    | program command
    ;

command:
      INC     { printf("++*ptr;\n"); }
    | DEC     { printf("--*ptr;\n"); }
    | MOVR    { printf("++ptr;\n"); }
    | MOVL    { printf("--ptr;\n"); }
    | OUT     { printf("putchar(*ptr);\n"); }
    | IN      { printf("*ptr=getchar();\n"); }
    | LB      { printf("while(*ptr){\n"); }
    | RB      { printf("}\n"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("#include <stdio.h>\n");
    printf("char mem[30000] = {0};\n");
    printf("char *ptr = mem;\n");
    printf("int main() {\n");

    yyparse();

    printf("return 0;\n");
    printf("}\n");

    return 0;
}
