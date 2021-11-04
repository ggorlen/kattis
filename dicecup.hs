import Data.List

cartProd :: [a] -> [b] -> [(a,b)]
cartProd xs ys = [(x,y) | x <- xs, y <- ys]

main :: IO ()
main = do
    line <- getLine
    let (n:m:_) = map read $ words line :: [Int]
    let grouped = group $ sort $ map (\(x,y) -> x + y) $ cartProd [1..n] [1..m]
    let longest = maximum $ map length grouped
    putStr $ unlines $ map show $ map head $ filter (\x -> length x == longest) grouped

