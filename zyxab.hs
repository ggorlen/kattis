import Control.Monad (replicateM)
import Data.List (sort, sortBy, groupBy)

allUniqueChars :: [Char] -> Bool
allUniqueChars xs = (length $ groupBy (\x y -> x == y) $ sort xs) == length xs

comparator :: [Char] -> [Char] -> Ordering
comparator x y =
    if length x == length y
    then compare y x
    else compare (length x) (length y)

main :: IO ()
main = do
    n <- readLn
    remainingLines <- replicateM n getLine
    let candidates = filter (\x -> length x > 4 && allUniqueChars x) $ remainingLines
    putStrLn $ if null candidates then "neibb!" else head $ sortBy comparator candidates
