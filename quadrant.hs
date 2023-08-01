quadrant :: Int -> Int -> Int
quadrant a b
    | a > 0 && b > 0 = 1
    | a < 0 && b > 0 = 2
    | a < 0 && b < 0 = 3
    | otherwise = 4

main :: IO ()
main = do
    a <- readLn
    b <- readLn
    print $ quadrant a b
