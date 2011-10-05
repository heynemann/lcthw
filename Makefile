clean:
	@find . -name '*.o' -delete

run: clean
	@echo '----------------------------------------'
	@echo '        Running Chapter number ${c}'
	@echo '----------------------------------------'
	@echo
	@rm -rf chapters/${c}/ex${c}
	@gcc -std=c99 -Wall -lm chapters/${c}/ex${c}.c -o chapters/${c}/ex${c} && time chapters/${c}/ex${c}
