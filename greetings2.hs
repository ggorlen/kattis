main = do
    greeting <- getLine
    putStrLn $ "h" ++ (replicate (2 * length (filter (== 'e') greeting)) 'e') ++ "y"
