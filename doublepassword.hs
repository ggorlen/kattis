countSameByPosition :: (Eq a) => [(a, a)] -> Int
countSameByPosition xs = do
    foldl (\a (x, y) -> if x == y then a else a + 1) 0 xs

main :: IO ()
main = do
    a <- getLine
    b <- getLine
    print $ 2 ^ (countSameByPosition $ zip a b)
