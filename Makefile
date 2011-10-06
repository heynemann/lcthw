all: clean
	@for c in `ls chapters`; do make run c=$$c && echo ''; done

test: clean
	@for c in `ls chapters`; do make run c=$$c && valgrind chapters/$$c/ex$$c && echo ''; done

clean:
	@find . -name '*.o' -delete

run: clean
	@echo ''
	@echo '----------------------------------------'
	@echo '        Running Chapter number ${c}'
	@echo '----------------------------------------'
	@echo
	@rm -rf chapters/${c}/ex${c}
	@gcc -std=c99 -Wall -lm chapters/${c}/ex${c}.c -o chapters/${c}/ex${c} && time chapters/${c}/ex${c}
	@echo '----------------------------------------'
	@echo '        End of Chapter number ${c}'
	@echo '----------------------------------------'
	@echo ''

new:
	@cp -r template chapters/ && mv chapters/template chapters/${c}
	@cd chapters/${c} && sed -i s/{c}/${c}/g ex.c
	@mv chapters/${c}/ex.c chapters/${c}/ex${c}.c
	@echo 'Chapter ${c} skeleton created. Happy hacking!'
