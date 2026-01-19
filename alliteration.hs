import Control.Monad
import Data.List (intercalate, sortBy)
import qualified Data.Map.Strict as Map

comparator x y =
    if xCount == yCount then
        compare (fst x) (fst y)
    else
        compare yCount xCount
    where
        xCount = snd x
        yCount = snd y

main :: IO ()
main = do
    n <- readLn
    remainingLines <- replicateM n getLine
    let stripped = map (\x -> map head $ words x) $ remainingLines
    let counter = Map.empty :: Map.Map Char Int
    let counts = map (\line -> foldl (\acc e -> Map.insertWith (+) e 1 acc) counter line) $ stripped
    let mostFreqFirstLetters = map (\x -> fst $ head $ sortBy comparator $ Map.toList x) counts
    putStrLn $ intercalate "\n" $ map return mostFreqFirstLetters
