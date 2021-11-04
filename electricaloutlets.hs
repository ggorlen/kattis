import Control.Monad

main :: IO ()
main = do
    n <- readLn
    forM_ [1 .. n] $ \i -> do
        line <- getLine
        let (k:outlets) = map read $ words line :: [Int]
        print $ (sum outlets) - k + 1
