#ifndef _COMMENTS_H
#define _COMMENTS_H

enum colour {
  red,
  green,
  blue
};

typedef char *tString;

float bar (int);
int foobar (tString,int,int*,float);

/* A #define enum
 */
#define THIS 1
#define THAT 2

#endif /* !_COMMENTS_H */
