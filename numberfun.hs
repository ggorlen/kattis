import Control.Monad (replicateM)
import Data.List (intercalate)

toInt :: String -> Int
toInt x = read x :: Int

lineToInts :: String -> [Int]
lineToInts x = map toInt $ words x

canProduce :: Int -> Int -> Int -> Bool
canProduce x y z = do
    x + y == z || x * y == z || x - y == z || (x `div` y == z && x `mod` y == 0)

canProduceEitherWay :: [Int] -> String
canProduceEitherWay (x:y:z:_) = do
    if canProduce x y z || canProduce y x z then "Possible" else "Impossible"

main :: IO ()
main = do
    n <- readLn
    remainingLines <- replicateM n getLine
    putStrLn $ intercalate "\n" $ map canProduceEitherWay $ map lineToInts remainingLines
