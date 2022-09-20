import Control.Monad

main :: IO ()
main = do
    n <- readLn
    forM_ [1..n] $ \i -> do
        line <- getLine
        let counts = map read $ (words line) :: [Int]
        print $ foldl (\a (curr, last) -> a + (max 0 (curr - last * 2))) 0 $ zip (tail counts) counts

