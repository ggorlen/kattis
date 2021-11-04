main = do
    let pieces = [1, 1, 2, 2, 2, 8]
    line <- getLine
    let zipped = zip pieces (map read $ words line :: [Int])
    putStrLn $ unwords $ map (\(x, y) -> show (x - y)) zipped
