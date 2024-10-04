# C Compiler in Haskell

## Overview

This project is a simple C compiler written in Haskell that compiles a minimal subset of the C language. The goal is to provide a foundation for understanding the core components of a compiler, including lexical analysis, parsing, code generation, and optional type checking.

### Supported Features
Currently, this compiler supports:
- Variable assignment with integers.
- Basic arithmetic expressions (e.g., addition).
- Return statements in a simple function.

### Project Structure
The project is organized as follows:

c-compiler/ ├── src/ │ ├── Lexer.x # Lexer definitions for tokens (processed by Alex) │ ├── Parser.y # Parser definitions for syntax (processed by Happy) │ ├── AST.hs # Abstract Syntax Tree definitions for C constructs │ ├── CodeGen.hs # Code generator to transform AST into pseudo-assembly or machine code │ ├── TypeChecker.hs # Type checker for validating expressions (optional at first) │ ├── Main.hs # Main entry point to compile input files │ └── Tokens.hs # Token definitions (output from Alex) │ ├── tests/ │ ├── sample.c # Sample input C code to test the compiler │ └── test_cases.hs # Haskell test cases for unit testing Lexer, Parser, CodeGen, etc. │ ├── Makefile # Build file to automate compilation using alex, happy, and ghc ├── README.md # Overview of the project, instructions for setup and usage └── .gitignore # Standard .gitignore for Haskell and compiled files

---

## Installation

### Prerequisites
You need the following tools installed:
- **GHC**: The Glasgow Haskell Compiler.
- **Alex**: A lexical analyzer generator for Haskell.
- **Happy**: A parser generator for Haskell.

#### Install GHC, Alex, and Happy
On macOS:

```bash
brew install ghc cabal-install
cabal update
cabal install alex happy
```

## Building the Compiler

```bash
make
```

The Makefile will:

Run alex on src/Lexer.x to generate src/Lexer.hs.
Run happy on src/Parser.y to generate src/Parser.hs.
Compile the Haskell code into an executable named compiler.

#### To clean up generated files, run:

```bash
make clean
```

## Usage

The compiled executable can be run from the command line. Currently, the example code is hardcoded, but you can modify Main.hs to read from a file.

```bash
./compiler
```

## Example Code
Here is the input C code (found in tests/sample.c):

```bash
int main() {
    return 1 + 2;
}
```

Running ./compiler generates the following pseudo-assembly:

```bash
push 1
push 2
add
ret
```

## Running tests

Unit tests are included in tests/test_cases.hs, covering Lexer, Parser, and CodeGen. To run the tests, use:

```bash
runhaskell tests/test_cases.hs
```

The test results will indicate whether each compiler component works as expected.

---

## Extending the Compiler

Additional Expressions: Extend the parser and code generator to handle subtraction, multiplication, and division.
Conditionals and Loops: Add support for if statements and loops (like while and for).
Function Calls: Implement support for defining and calling functions.
Type Checking: Add functionality in TypeChecker.hs to verify that expressions have correct types and detect type errors.
Optimizations: Add optimizations such as constant folding, dead code elimination, and register allocation for performance improvements.
Code Generation for Real Assembly: Adapt CodeGen.hs to output real assembly code for a specific architecture, such as x86 or ARM.

## Resources

<a href="https://book.realworldhaskell.org">Real World Haskell</a>: Excellent book for learning Haskell and functional programming.</br>
<a href="https://en.wikipedia.org/wiki/Compilers:_Principles,_Techniques,_and_Tools">Compilers</a>: Principles, Techniques, and Tools: Also known as the "Dragon Book," this is the classic book on compiler construction.