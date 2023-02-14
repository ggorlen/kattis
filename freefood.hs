import Control.Monad (replicateM)
import Data.List (nub)

toInt :: String -> Int
toInt x = read x :: Int

lineToInts :: String -> [Int]
lineToInts x = map toInt $ words x

separateRange (x:y:_) = [x..y]

main :: IO ()
main = do
    n <- readLn
    remainingLines <- replicateM n getLine
    print $ length $ nub $ concat $ map separateRange $ map lineToInts remainingLines

