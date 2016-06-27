grammar Calc;

prog:   (stat | fun)+ ;

fun:    ID ARROW expr ;

stat:   expr NEWLINE                # printExpr
    |   ID '=' expr NEWLINE         # assign
    |	CLEAR NEWLINE				# clear
    |   NEWLINE                     # blank    
    ;

expr:   expr op=('*'|'/') expr      # MulDiv
    |   expr op=('+'|'-') expr      # AddSub    
    |   INT                         # int
    |   ID '(' ')'                  # call
    |   ID                          # id
    |   '(' expr ')'                # parens
    ;



// Lexer rules


CLEAR :     'clear' ;
ARROW :     '->' ;
MUL :       '*' ; // assigns token name to '*' used above in grammar
DIV :       '/' ;
ADD :       '+' ;
SUB :       '-' ;
ID  :       [a-zA-Z]+ ;      // match identifiers
INT :       [0-9]+ ;         // match integers
NEWLINE:    '\r'? '\n' ;     // return newlines to parser (is end-statement signal)
WS  :       [ \t]+ -> skip; //toss out whitespace
COMMENT : '//' .*? NEWLINE -> skip; //toss out comments

