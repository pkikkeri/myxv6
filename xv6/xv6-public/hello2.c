#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void) {
	printf(1, "open text 2\n");
        open("test_2.txt",  O_RDONLY | O_CREATE);
        printf(1, "count: %d\n", getcount());
	
	trace("test_2.txt");
	printf(1, "open text 2\n");
	open("test_2.txt",  O_RDONLY | O_CREATE);
	printf(1, "count: %d\n", getcount());
	exit();
}
