import Control.Monad
import Data.List (sort)

enumerate :: [a] -> [(Int, a)]
enumerate xs = zip [0..] xs

allPotionsFit :: Int -> Int -> [Int] -> Bool
allPotionsFit n time xs = do
    all (\(i, duration) -> (duration - (time * (n - (i + 1)))) > 0) $ enumerate xs

main :: IO ()
main = do
    line <- getLine
    let (n:time:_) = map read $ words line :: [Int]
    remainingLines <- replicateM n getLine
    let potions = map read $ remainingLines :: [Int]
    let descPotions = reverse $ sort potions
    putStrLn $ if allPotionsFit n time descPotions then "YES" else "NO"
