CC = $(CROSS_COMPILE)gcc

TARGET=nc
TARGET_EXE=$(TARGET)

SRC = getopt.c doexec.c netcat.c
OBJ = $(SRC:.c=.o)

DEPEND_STATIC_LIB =

CFLAGS = -DTELNET 
CFLAGS += -I./
LDFLAGS += -lkernel32 -luser32 -lwinmm -lws2_32

$(TARGET_EXE):$(OBJ) $(DEPEND_STATIC_LIB);$(CC) -o $@ $^ $(LDFLAGS)
$(filter %.o,$(OBJ)):%.o:%.c;$(CC) $(CFLAGS) -c -o $@ $<

.PHONY:install
install:
	 mv $(TARGET_EXE) ../../output/bin/

.PHONY:clean
clean:
	 rm -f $(OBJ) $(TARGET_EXE)
