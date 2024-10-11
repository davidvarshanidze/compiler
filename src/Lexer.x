{
module Lexer where
}

%wrapper "basic"

$white = [ \t\n\r]
$digit = [0-9]
$alpha = [a-zA-Z]

tokens :-

$white+                  ;  -- Skip whitespace
"int"                    { \s -> IntType }
"return"                 { \s -> Return }
$alpha($alpha|$digit)*   { \s -> Ident s }
$digit+                  { \s -> IntLiteral (read s) }
"("                      { \s -> LParen }
")"                      { \s -> RParen }
"{"                      { \s -> LBrace }
"}"                      { \s -> RBrace }
";"                      { \s -> Semicolon }
"="                      { \s -> Assign }
"+"                      { \s -> Plus }

{
data Token = IntType | Return | Ident String | IntLiteral Int
           | LParen | RParen | LBrace | RBrace
           | Semicolon | Assign | Plus
           deriving (Show, Eq)

alexScanTokens :: String -> [Token]
alexScanTokens = tokens
}
