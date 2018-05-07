.PHONY: all test clean

all: perfecthash.h test

command_line: command_line.c perfecthash.h command_options.h
	$(CC) $< -std=c11 -o $@

perfecthash.h: command_line_options.gperf
	gperf -CGD -N IsValidCommandLineOption -K Option -t $< > $@

clean:
	rm -f perfecthash.h
	rm -f command_line

test: command_line
	./command_line +helpverbose -xyz +nolog
