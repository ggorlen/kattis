import Control.Monad (replicateM)
import Data.List (elemIndex, foldl', intercalate)

indexOf :: Eq a => a -> [a] -> Int
indexOf i xs = maybe (- 1) (+0) $ i `elemIndex` xs

removeAt :: Eq a => Int -> [a] -> [a]
removeAt i xs = (take i xs) ++ (drop (i + 1) xs)

addAt :: Eq a => Int -> a -> [a] -> [a]
addAt i el xs = (take i xs) ++ [el] ++ (drop i xs)

reorder :: [Int] -> [Int] -> [Int]
reorder games [winner, loser] = do
    let winnerIndex = indexOf winner games
    let loserIndex = indexOf loser games
    if winnerIndex < loserIndex then games
    else addAt winnerIndex loser $ removeAt loserIndex games

main :: IO ()
main = do
    line <- getLine
    let n = read (head $ words $ line) :: Int
    let m = read (head $ tail $ words $ line) :: Int
    lines <- replicateM m getLine
    let games = map (\x -> map (\x -> read (tail x) :: Int) $ words x) lines
    let ranks = [1..n]
    putStrLn $ intercalate " " $ map (\x -> "T" ++ show x) $ foldl' reorder ranks games
