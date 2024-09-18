#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

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
depending on the value of the parameter int c, which is the most recently read character*/
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
    return state;
}
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
    return state;
}
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
    return state;
}
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
    return state;
}
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
    return state;
}
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
    return state;
}
enum Statetype handleBackslashState(int c)
{
    enum Statetype state;
    state = START_OF_QUOTATION;
    putchar(c);
    return state;
}
enum Statetype handleBackslashSingleState(int c)
{
    enum Statetype state;
    state = START_OF_SINGLE_QUOTATION;
    putchar(c);
    return state;
}
int main(void)
{
    int c;
    enum Statetype state = START;
    while ((c = getchar()) != EOF)
    {
        switch (state)
        {
        case START:
            state = handleStartState(c);
            break;
        case MIGHT_BE_COMMENT:
            state = handleMightBeCommentState(c);
            break;
        case COMMENT:
            state = handleCommentState(c);
            break;
        case MIGHT_END_COMMENT:
            state = handleMightEndCommentState(c);
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
    if (state = MIGHT_BE_COMMENT) {
        putchar('/');
    }
    if (state == COMMENT || state == MIGHT_END_COMMENT){
         fprintf(stderr, "Unterminated comment line:");
	 exit(EXIT_FAILURE);
    }
    return 0;
}
