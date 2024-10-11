all: build run

build:
	alex src/Lexer.x
	happy --ghc src/Parser.y
	ghc -isrc -o compiler src/Main.hs src/AST.hs src/CodeGen.hs src/TypeChecker.hs src/Lexer.hs src/Parser.hs

run: build
	./compiler

clean:
	rm -f src/*.hi src/*.o src/Lexer.hs src/Parser.hs compiler
