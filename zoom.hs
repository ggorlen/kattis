import Data.List (intercalate)

dropEveryNth _ _ [] = []
dropEveryNth i k xs = do
    if i `mod` k == 0 then [head xs] ++ (dropEveryNth (i + 1) k $ tail xs)
    else dropEveryNth (i + 1) k $ tail xs

main :: IO ()
main = do
    line <- getLine
    line2 <- getLine
    let k = read (head $ tail $ words $ line) :: Int
    putStrLn $ intercalate " " $ dropEveryNth 1 k $ words line2
