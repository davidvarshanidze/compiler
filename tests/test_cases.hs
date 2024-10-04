module TestCases where
import Lexer
import Parser
import CodeGen
import AST
import Test.HUnit

testLexer = TestCase (assertEqual "Lexing simple code"
                      [IntType, Ident "main", LParen, RParen, LBrace, Return, IntLiteral 1, Plus, IntLiteral 2, Semicolon, RBrace]
                      (alexScanTokens "int main() { return 1 + 2; }"))

testParser = TestCase (assertEqual "Parsing simple code"
                       (Program [Function "main" [ReturnStmt (AddExpr (IntExpr 1) (IntExpr 2))]])
                       (parse (alexScanTokens "int main() { return 1 + 2; }")))

testCodeGen = TestCase (assertEqual "Generating code for simple code"
                        "push 1\npush 2\nadd\nret\n"
                        (generateCode (Program [Function "main" [ReturnStmt (AddExpr (IntExpr 1) (IntExpr 2))]])))

main :: IO Counts
main = runTestTT $ TestList [testLexer, testParser, testCodeGen]
