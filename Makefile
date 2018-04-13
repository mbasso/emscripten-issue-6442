INPUT = input-1_37_36.bc

OPTIONS = \
	-O3 \
	--bind \
	--memory-init-file 1 \
	--llvm-lto 3 \
	--llvm-opts 3 \
	--js-opts 1 \
	--closure 1 \
	--pre-js prefix.js \
	--post-js postfix.js \
	-s ALLOW_MEMORY_GROWTH=1 \
	-s AGGRESSIVE_VARIABLE_ELIMINATION=1 \
	-s ABORTING_MALLOC=1 \
	-s NO_EXIT_RUNTIME=1 \
	-s NO_FILESYSTEM=1 \
	-s DISABLE_EXCEPTION_CATCHING=2 \
	-s BINARYEN=1 \
	-s EXPORTED_RUNTIME_METHODS=[\'UTF8ToString\'] \
	-s BINARYEN_TRAP_MODE=\'allow\'

.PHONY: all clean

all: dist/output.js

clean:
	rm -rf dist

dist:
	mkdir dist

dist/output.js: dist
	emcc \
		$(OPTIONS) \
		$(INPUT) \
		-o $@
