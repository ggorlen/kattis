split :: Char -> String -> [String]
split c str = 
    case break (== c) str of
        (a, _:b) -> a : split c b
        (a, _)   -> [a]

rangeSize :: [Int] -> Int
rangeSize x = if length x > 1 then (x!!1 - x!!0 + 1) else 1

splitRanges :: String -> [Int]
splitRanges x = map read $ split '-' x

main :: IO ()
main = do
    line <- getLine
    print $ sum $ map rangeSize $ map splitRanges $ split ';' line

