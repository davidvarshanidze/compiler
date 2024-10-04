module AST where

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
