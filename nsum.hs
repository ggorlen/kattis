main :: IO ()
main = do
    getLine
    line <- getLine
    print $ foldl (+) 0 (map read $ words line :: [Int])
