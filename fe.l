%{
#include "y.tab.h"
%}

%%

"➕"		{ return INC; }
"➖"		{ return DEC; }
"▶️"		{ return MOVR; }
"◀️"		{ return MOVL; }
"💬"		{ return OUT; }
"📨"		{ return IN; }
"⤵️"		{ return LB; }
"⤴️"		{ return RB; }
"📥"		{ return ENQUEUE; }
"📤"		{ return DEQUEUE; }
"📚"        	{ return PUSH; }
"🎒"        	{ return POP; }

[ \t\n]		{ /* ignore whitespace */ }
.		{ /* ignore all other characters */ }

%%

int yywrap(void) {
    return 1;
}
