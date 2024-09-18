#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

/*declares eight states*/
enum Statetype
{
    START,
    MIGHT_BE_COMMENT,
    COMMENT,
    MIGHT_END_COMMENT,
    START_OF_QUOTATION,
    BACKSLASH,
    BACKSLASH_SINGLE,
    START_OF_SINGLE_QUOTATION
};
/*returns one of states MIGHT_BE_COMMENT, START_OF_QUOTATION, START_OF_SINGLE_QUOTATION, or START
depending on the value of the integer parameter c, which is the most recently read character*/
enum Statetype handleStartState(int c) {
    enum Statetype state;
    if (c=='/') {
        state = MIGHT_BE_COMMENT;
    } else if (c=='"'){
        putchar(c);
        state = START_OF_QUOTATION;
    } else if (c=='\''){
        putchar(c);
        state = START_OF_SINGLE_QUOTATION;
    } else {
        putchar(c);
        state = START;
    }
/*if (c == '\n') (*lineNumber)++;*/
    return state;
}
/*returns one of states COMMENT, MIGHT_BE_COMMENT, START_OF_QUOTATION, START_OF_SINGLE_QUOTATION, or START
depending on the value of the integer parameter c, which is the most recently read character*/
enum Statetype handleMightBeCommentState(int c) {
    enum Statetype state;
    if (c=='*') {
        putchar(' ');
        state = COMMENT;
    } else if (c=='/'){
        putchar('/');
        state = MIGHT_BE_COMMENT;
    } else if (c=='"'){
        putchar('/');
        putchar(c);
        state = START_OF_QUOTATION;
    } else if ('\'') {
        putchar('/');
        putchar(c);
        state = START_OF_SINGLE_QUOTATION;
    } else {
        putchar('/');
        putchar(c);
        state = START;
    }
/*if (c == '\n') (*lineNumber)++;*/
    return state;
}
/*returns one of states MIGHT_END_COMMENT or COMMENT
depending on the value of the integer parameter c, which is the most recently read character*/
enum Statetype handleCommentState(int c)
{
    enum Statetype state;
    if (c=='*') {
        state = MIGHT_END_COMMENT;
    } else if (c=='\n') {
        putchar('\n');
        state = COMMENT;
    } else {
        state = COMMENT;
    }
/*if (c == '\n') (*lineNumber)++;*/
    return state;
}
/*returns one of states MIGHT_BE_COMMENT, COMMENT, or START
depending on the value of the integer parameter c, which is the most recently read character*/
enum Statetype handleMightEndCommentState(int c)
{
    enum Statetype state;
    if (c=='*') {
        state = MIGHT_END_COMMENT;
    } else if (c=='\n') {
        putchar('\n');
        state = COMMENT;
    }
    else if (c=='/'){
        state = START;
    } else {
        state = COMMENT;
    }
/*if (c == '\n') (*lineNumber)++;*/
    return state;
}
/*returns one of states MIGHT_BE_COMMENT, START_OF_QUOTATION, START_OF_SINGLE_QUOTATION, or START
depending on the value of the parameter c, which is the most recently read character*/
enum Statetype handleStartOfQuotationState(int c)
{
    enum Statetype state;
    if (c=='\\'){
        putchar(c);
        state = BACKSLASH;
    } else if (c=='"'){
        putchar(c);
        state = START;
    } else {
        putchar(c);
        state = START_OF_QUOTATION;
    }
/*if (c == '\n') (*lineNumber)++;*/
    return state;
}
/*returns one of states BACKSLASH, START_OF_SINGLE_QUOTATION, or START
depending on the value of the integer parameter c, which is the most recently read character*/
enum Statetype handleStartOfSingleQuotationState(int c)
{
    enum Statetype state;
    if (c=='\\'){
        putchar(c);
        state = BACKSLASH_SINGLE;
    } else if (c=='\''){
        putchar(c);
        state = START;
    } else {
        putchar(c);
        state = START_OF_SINGLE_QUOTATION;
    }
/*if (c == '\n') (*lineNumber)++;*/
    return state;
}
/*returns state START_OF_QUOTATION and prints integer parameter c, which is the most recently read character*/
enum Statetype handleBackslashState(int c)
{
    enum Statetype state;
    state = START_OF_QUOTATION;
    putchar(c);
    return state;
}
/*returns state START_OF_SINGLE_QUOTATION and prints integer parameter c, which is the most recently read character*/
enum Statetype handleBackslashSingleState(int c)
{
    enum Statetype state;
    state = START_OF_SINGLE_QUOTATION;
    putchar(c);
    return state;
}
/* 
Reads characters from stdin, processes them based on a state machine handling text, comments, and literals, and prints to stdout. 
Returns 0 on success or exits with failure (prints error to stderr) if an unterminated comment is found.
 */
int main(void)
{
    int c;
    int lineNumber = 1;
    int commentStartLine=0;
    enum Statetype state = START;
    while ((c = getchar()) != EOF)
    {
        if (c == '\n') (lineNumber)++;
        switch (state)
        {
        case START:
            state = handleStartState(c);
            break;
        case MIGHT_BE_COMMENT:
            state = handleMightBeCommentState(c);
            if (state == COMMENT && commentStartLine == 0) {
                commentStartLine = lineNumber;
            }
            break;
        case COMMENT:
            state = handleCommentState(c);
            break;
        case MIGHT_END_COMMENT:
            state = handleMightEndCommentState(c);
            if (state == START) {
                commentStartLine = 0;
            }
            break;
        case START_OF_QUOTATION:
            state = handleStartOfQuotationState(c);
            break;
        case START_OF_SINGLE_QUOTATION:
            state = handleStartOfSingleQuotationState(c);
            break;
        case BACKSLASH:
            state = handleBackslashState(c);
            break;
        case BACKSLASH_SINGLE:
            state = handleBackslashSingleState(c);
            break;
        }
    }
    if (state == MIGHT_BE_COMMENT) {
        putchar('/');
    }
    if (state == COMMENT || state == MIGHT_END_COMMENT){
         fprintf(stderr, "Error: line %d: unterminated comment\n", commentStartLine);
	 exit(EXIT_FAILURE);
    }
    return 0;
}
