import Data.Char (ord)
import Data.List (elemIndex, intercalate, sort, sortBy)

indexOf :: Eq a => a -> [a] -> Int
indexOf i xs = maybe (- 1) (+0) $ i `elemIndex` xs

sorter :: (Int, Int) -> (Int, Int) -> [Int] -> Ordering
sorter x y letterRanks =
    compare (indexOf (snd x) letterRanks) (indexOf (snd y) letterRanks)

join :: [Char] -> [Int] -> [Char]
join sep xs = intercalate sep $ map show xs

main :: IO ()
main = do
    digits <- getLine
    letters <- getLine
    let sortedDigits = sort $ map read $ words digits :: [Int]
    let letterRanks = map (\x -> (ord x) - 65) letters
    putStrLn $ join " " $ map fst $ sortBy (\x y -> sorter x y letterRanks) $ zip sortedDigits [0..]
