{
module Parser where
import Lexer
}

%name parse
%tokentype { Token }
%error { parseError }

%token
  int    { IntType }
  return { Return }
  ident  { Ident $$ }
  intLit { IntLiteral $$ }
  '('    { LParen }
  ')'    { RParen }
  '{'    { LBrace }
  '}'    { RBrace }
  ';'    { Semicolon }
  '='    { Assign }
  '+'    { Plus }

%%

Program :: Program
    : Function { Program $$ }

Function :: Function
    : int ident '(' ')' '{' Stmt '}' { Function $$1 $$3 }

Stmt :: Stmt
    : ident '=' Exp ';' { AssignStmt $$1 $$3 }
    | return Exp ';'    { ReturnStmt $$2 }

Exp :: Exp
    : intLit             { IntExpr $$ }
    | ident              { VarExpr $$ }
    | Exp '+' Exp        { AddExpr $$1 $$3 }

{
data Program = Program [Function]
    deriving (Show)

data Function = Function String [Stmt]
    deriving (Show)

data Stmt = AssignStmt String Exp
          | ReturnStmt Exp
    deriving (Show)

data Exp = IntExpr Int
         | VarExpr String
         | AddExpr Exp Exp
    deriving (Show)

parseError :: [Token] -> a
parseError _ = error "Parse error"
}
