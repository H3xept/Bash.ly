CC = clang

FRAMEWORKS = -framework Foundation -framework AppKit

SOURCE = ConnectionController.m Main.m

CFLAGS = -Wall -Werror $(SOURCE)
LDFLAGS = $(LIBRARIES) $(FRAMEWORKS)
OUT = -o /usr/bin/short

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)
