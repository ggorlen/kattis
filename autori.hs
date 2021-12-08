main :: IO ()
main = do
    line <- getLine
    putStrLn $ map fst $ filter (\(e, i) -> i == 0 || (line!!(i - 1)) == '-') (zip line [0..])
