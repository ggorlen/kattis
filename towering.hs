import Data.List (find, intercalate, permutations, sort)
import Data.Maybe (maybe)

prepare :: [Int] -> String
prepare xs = intercalate " " $ map show $ reverse $ sort xs

main :: IO ()
main = do
    line <- getLine
    let ints = map (\x -> read x :: Int) $ words line
        [a, b] = drop 6 ints
        boxes = take 6 ints
        res = find (\x -> (sum (take 3 x) == a) && (sum (drop 3 x)) == b) $ permutations boxes
    putStrLn $ maybe "" (\xs -> (prepare $ take 3 xs) ++ " " ++ (prepare $ drop 3 xs)) res
