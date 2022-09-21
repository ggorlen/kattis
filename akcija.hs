import Control.Monad
import Data.List (sort)

enumerate :: [a] -> [(Int, a)]
enumerate xs = zip [0..] xs

dropEveryNth :: Int -> [a] -> [a]
dropEveryNth n xs = do
    map snd $ filter (\(i, e) -> i `mod` n /= (n - 1)) $ enumerate xs

main :: IO ()
main = do
    n <- readLn
    remainingLines <- replicateM n getLine
    let prices = map read $ remainingLines :: [Int]
    print $ sum $ dropEveryNth 3 $ reverse $ sort prices

