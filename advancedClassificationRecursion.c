#include <stdio.h>
#include <math.h>
#include "NumClass.h"

// helper
int isPalindromeHelper(int num, int temp, int reverse) {
if (temp == 0) {
     if (num == reverse) {
          return 1;
 } else {
            return 0;
        }
}
int r = temp % 10;
reverse = reverse * 10 + r;
temp = temp / 10;
return isPalindromeHelper(num, temp, reverse);

}
int isPalindrome(int num) {
    return isPalindromeHelper(num, num, 0);
}

// helper methods:

int isArmstrongRHelper(int n, int size) {
    if (n == 0) {
        return 0;
    }
    int r = n % 10;
    return pow(r, size) + isArmstrongRHelper(n / 10, size);
}

int countDigis(int n) {
    if (n == 0) {
        return 0;
    }
    return 1 + countDigis(n / 10);
}

int isArmstrong(int n) {
    int size = countDigis(n);
   return n == isArmstrongRHelper(n, size);
}


