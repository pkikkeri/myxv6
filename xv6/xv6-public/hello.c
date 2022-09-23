#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void) {
	printf(1, "Hello there!\n");
	printf(1, "count: %d\n",getcount());
	
	printf(1, "open text 1\n");
        open("test_1.txt", O_RDONLY | O_CREATE);
        printf(1, "count: %d\n", getcount());

	printf(1, "trace call for empty string: %d\n", trace(""));

	printf(1, "trace call output: %d\n", trace("../dummy"));
	printf(1, "count: %d\n", getcount());
	
	trace("test_1.txt");
	printf(1, "open text 1\n");
	open("test_1.txt",  O_RDONLY | O_CREATE);
	printf(1, "count: %d\n", getcount());
	printf(1, "open text 11\n");
        open("test_11.txt",  O_RDONLY | O_CREATE);
        printf(1, "count: %d\n", getcount());

	printf(1, "open text 2\n");
        open("test_2.txt",  O_RDONLY | O_CREATE);
        printf(1, "count: %d\n", getcount());

	trace("test_2.txt");
	printf(1, "open text 2\n");
        open("test_2.txt",  O_RDONLY | O_CREATE);
	printf(1, "open text 2\n");
        open("test_2.txt",  O_RDONLY | O_CREATE);
	printf(1, "open text 2\n");
        open("test_2.txt",  O_RDONLY | O_CREATE);
	printf(1, "open text 1\n");
        open("test_1.txt",  O_RDONLY | O_CREATE);
        printf(1, "count: %d\n", getcount());
	exit();
}
