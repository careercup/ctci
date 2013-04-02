/*
 * Implement a function void reverse(char* str) in C or C++
 * which reverses a null-terminated string
 */

/* This is a classic interview question.
 * The only "gotcha" is to try to do it inplace,
 * and be careful for the null character.
 */
/*
void reverse(char *str) {
  char* end = str;
  char tmp;
  if (str) {
    while (*end) { /* find end of the string */
      ++end;
    }

    --end; /* set one char back, since last char is null */

    /*
     * swap characters from start of string with the end of
     * the string, until the pointers meet in the middle.
     */
    while (str < end) {
      tmp = *str;
      *str++ = *end;
      *end-- = tmp;
    }
  }
}
*/