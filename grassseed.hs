import Control.Monad

main :: IO ()
main = do
    c <- readLn
    n <- readLn
    remainingLines <- replicateM n getLine
    print $ foldl (+) 0 $ map (\[a, b] -> c * a * b) $ map (\a -> (map (\b -> read b :: Float) (words a))) remainingLines
