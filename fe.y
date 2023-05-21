%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
void yyerror(const char *s);
%}

%token INC DEC MOVR MOVL OUT IN LB RB ENQUEUE DEQUEUE PUSH POP

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
    | ENQUEUE { printf("%s", "if (tail != 30000) { queue[tail++] = *ptr; tail %= 30000; }\n"); }
    | DEQUEUE { printf("%s", "if (head != tail) { *ptr = queue[head++]; head %= 30000; }\n"); }
	| PUSH    { printf("stack[sp++] = *ptr;\n"); }
    | POP     { printf("if (sp > 0) *ptr = stack[--sp];\n"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("#include <stdio.h>\n");
    printf("char mem[30000] = {0};\n");
    printf("char *ptr = mem;\n");
    printf("char queue[30000] = {0};\n");
    printf("int head = 0, tail = 0;\n");
    printf("char stack[30000] = {0};\n");
    printf("int sp = 0;\n");
    printf("int main() {\n");

    yyparse();

    printf("return 0;\n");
    printf("}\n");

    return 0;
}
