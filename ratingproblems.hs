import Control.Monad

main :: IO ()
main = do
    line <- getLine
    let (n:k:_) = map read $ words line
    ratings <- replicateM k getLine
    let total = sum $ map read $ ratings
    let nn = fromIntegral n
    let lower = (fromIntegral ((-3 * (n - k)) + total)) / nn
    let upper = (fromIntegral ((3 * (n - k)) + total)) / nn
    putStrLn $ (show lower) ++ " " ++ (show upper) 

