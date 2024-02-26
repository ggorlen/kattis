-- TLE, look into using Data.Map
import Control.Monad (replicateM)
import Data.List (intercalate)

toInt :: String -> Int
toInt x = read x :: Int

secondToInt :: [String] -> (String, Int)
secondToInt xs = (head xs, toInt $ head $ tail xs)

chunkJobDescriptions :: [String] -> String -> [String]
chunkJobDescriptions [] _ = []
chunkJobDescriptions xs currentChunk = do
    if head xs == "." then
        [currentChunk] ++ (chunkJobDescriptions (tail xs) [])
    else
        chunkJobDescriptions (tail xs) (currentChunk ++ " " ++ (head xs))

findValueInDict :: [(String, Int)] -> String -> Int
findValueInDict [] _ = 0
findValueInDict dict target = do
    if (fst $ head dict) == target then
        snd $ head dict
    else
        findValueInDict (tail dict) target

countMatches :: [(String, Int)] -> [String] -> Int
countMatches dict xs =
    foldl (\a e -> a + findValueInDict dict e) 0 xs

main :: IO ()
main = do
    mn <- getLine
    let m:n:_ = map (\x -> read x :: Int) $ words mn
    rawDict <- replicateM m getLine
    let dict = map secondToInt $ map words rawDict
    rest <- getContents
    putStrLn $ intercalate "\n" $ map show $ map (\xs -> countMatches dict xs) $ map words $ chunkJobDescriptions (lines rest) []
