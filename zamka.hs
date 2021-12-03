import Control.Monad

toDigits :: String -> [Int]
toDigits xs = [read [m] | m <- xs]
--toDigits xs = map (\x -> read [x]) xs

main :: IO ()
main = do
    lines <- replicateM 3 getLine
    let (l:d:x:_) = map read lines
    let matches = filter (\y -> x == (sum $ toDigits $ show y)) [l..d]
    print $ minimum matches
    print $ maximum matches
