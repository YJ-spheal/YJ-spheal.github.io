#include <stdio.h>

void SelectionSort(int* p)
{
    int i, j, temp;
    for (i = 0; i < 5 - 1; i++) {
        for (j = i + 1; j < 5; j++) {
            if (*(p + i) > *(p + j)) {
                temp = *(p + i);
                *(p + i) = *(p + j);
                *(p + j) = temp;
            }
        }
    }
}

void main(void)
{
    int intNum[5] = { 3, 2, 1, 5, 4 };
    int i;

    for (i = 0; i < 5; i++) {
        printf("%d\n", intNum[i]);
    }
}