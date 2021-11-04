main = do
    line <- getLine
    print $ foldl (*) 1 (map read $ words line :: [Int])

