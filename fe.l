%{
#include "y.tab.h"
%}

%%

"➕"          { return INC; }
"➖"          { return DEC; }
"▶️"           { return MOVR; }
"◀️"           { return MOVL; }
"💬"          { return OUT; }
"📨"          { return IN; }
"⤵️"          { return LB; }
"⤴️"          { return RB; }

[ \t\n]      { /* ignore whitespace */ }
.            { /* ignore all other characters */ }

%%

int yywrap(void) {
    return 1;
}
