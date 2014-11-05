TARGET = swift-with-c-lib
MYLIB  = libmylib.so
SRCS   = main.swift
OBJS   = $(SRCS:.swift=.o)

all: $(TARGET)

$(TARGET): $(OBJS) $(MYLIB)
	swiftc -o $@ $(OBJS) -L. -lmylib

main.o: main.swift
	swiftc -c -import-objc-header bridge.h $<

$(MYLIB):
	clang -shared -o $@ mylib.c

.PHONY: clean
clean:
	rm $(TARGET) $(MYLIB) $(OBJS)

