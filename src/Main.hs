module Main where
import Lexer
import Parser
import CodeGen

main :: IO ()
main = do
    let sourceCode = "int main() { return 1 + 2; }"
    let tokens = alexScanTokens sourceCode
    let ast = parse tokens
    let code = generateCode ast
    putStrLn code
