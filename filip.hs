main = do
    getLine
    line <- getLine
    print $ length $ filter (\n -> n < 0) (map read $ words line :: [Int])
