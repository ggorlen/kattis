import Data.Char

parseCpr :: String -> [Int]
parseCpr [] = []
parseCpr xs =
    if head xs == '-' then
        parseCpr $ tail xs
    else
        [(ord $ head xs :: Int) - 48] ++ (parseCpr $ tail xs)

main :: IO ()
main = do
    n <- getLine
    let multipliers = [4, 3, 2, 7, 6, 5, 4, 3, 2, 1]
    let result = sum $ map (\(x,y) -> x * y) $ zip multipliers (parseCpr n)
    print $ if result `mod` 11 == 0 then 1 else 0
