main :: IO ()
main = do
    line <- getLine
    putStrLn $ reverse line
