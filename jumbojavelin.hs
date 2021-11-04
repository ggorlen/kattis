import Control.Monad

main :: IO ()
main = do
    n <- readLn
    remainingLines <- replicateM n getLine
    print $ (foldl (+) 0 $ map read remainingLines) - n + 1
