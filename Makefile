CC = gcc
# CC = clang
CCFLAGS = -g -Wall -Wpedantic -pthread
# TARGET = s-talk.o list.o #instructorList.o
TARGET = list.o sender.o receiver.o init.o main.o #instructorList.o
# TARGET = main.o #instructorList.o

all: clean s-talk

s-talk: $(TARGET)
	$(CC) $(CCFLAGS) $(TARGET) -o s-talk


# $(TARGET): %.o: %.c
	# $(CC) -c $(CFLAGS) $< -o $@

# %.o: %.c
# 	$(CC) $(CCFLAGS) -c $@

list.o:
	$(CC) $(CCFLAGS) -c list.c
sender.o:
	$(CC) $(CCFLAGS) -c sender.c
receiver.o:
	$(CC) $(CCFLAGS) -c receiver.c
init.o:
	$(CC) $(CCFLAGS) -c init.c
main.o:
	$(CC) $(CCFLAGS) -c main.c

valgrind: s-talk
	valgrind -s --leak-check=full \
			 --show-leak-kinds=all \
			 --track-origins=yes \
			 --show-reachable=yes\
			./s-talk 5000 127.0.0.1 5001
# clean:
# 	rm -f s-talk.o *.out s-talk
clean:
	rm -f *.o *.out s-talk

s:
	./s-talk 5000 127.0.0.1 5001
l:
	./s-talk 5001 127.0.0.1 5000



