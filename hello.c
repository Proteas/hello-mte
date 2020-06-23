#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned char test(void)
{
	unsigned char buf[128];
	buf[256] = 0;
	return buf[255];
}

int main(void)
{
	unsigned char tmp = test();
	printf("%c\n", tmp);

	return 0;
}
