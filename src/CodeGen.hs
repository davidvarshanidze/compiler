module CodeGen where
import AST

generateCode :: Program -> String
generateCode (Program [Function _ stmts]) = unlines $ map genStmt stmts

genStmt :: Stmt -> String
genStmt (AssignStmt var (IntExpr n)) = "mov " ++ var ++ ", " ++ show n
genStmt (ReturnStmt expr) = "ret " ++ genExpr expr

genExpr :: Exp -> String
genExpr (IntExpr n) = "push " ++ show n
genExpr (VarExpr var) = "push " ++ var
genExpr (AddExpr e1 e2) = genExpr e1 ++ "\n" ++ genExpr e2 ++ "\nadd"
