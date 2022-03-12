import Control.Monad
import Text.Read

parseOrder :: [Char] -> Int
parseOrder order = case (readMaybe order :: Maybe Int) of
    Just n -> n
    Nothing -> 1 + (read (take (length order - 1) order) :: Int)

useWater :: (Int, Int, Int) -> [Char] -> (Int, Int, Int)
useWater (refillSize, water, refills) order = do
    let n = parseOrder order
    if water - n < 0
    then (refillSize, refillSize - n, refills + 1)
    else (refillSize, water - n, refills)

third :: (a, b, c) -> c
third (_, _, x) = x

main :: IO ()
main = do
    line <- getLine
    let lineSplit = words line
    let n = read $ head $ lineSplit
    let s = read $ head $ tail lineSplit
    orders <- replicateM n getLine
    print $ third $ foldl (useWater) (s, s, 0) orders

