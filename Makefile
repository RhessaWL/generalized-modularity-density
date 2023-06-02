CC      = gcc
TARGET  = main
C_FILES = $(wildcard *.c)
OBJS    = $(patsubst %.c,%.o,$(C_FILES))
CPPFLAGS  = -I/usr/local/opt/libomp/include -Xpreprocessor -fopenmp -lomp
LDFLAGS = -L/usr/local/opt/libomp/lib

.PHONY: all clean
all: $(TARGET)
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)
%.o: %.c %.h
	$(CC) $(CFLAGS) -c -o $@ $<
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<
clean:
	rm -f $(OBJS) $(TARGET) $(TARGET).exe
