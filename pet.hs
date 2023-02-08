import Control.Monad
import Data.List (maximumBy)
import Data.Ord (comparing)

toInt :: String -> Int
toInt x = read x :: Int

lineToInts :: String -> [Int]
lineToInts x = map toInt $ words x

main :: IO ()
main = do
    lines <- replicateM 5 getLine
    let scores = zip [1..] $ map sum $ map lineToInts lines
    let (idx,best) = maximumBy (comparing snd) scores
    putStrLn $ show idx ++ " " ++ show best
