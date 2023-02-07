import Data.List (intercalate, sort)

toInt :: String -> Int
toInt x = read x :: Int

areSequential :: (Int, Int) -> Bool
areSequential (a, b) = a + 1 == b

groupSequential :: [Int] -> [[Int]]
groupSequential [] = []
groupSequential [x] = [[x]]
groupSequential xs = do
    let neighbors = zip xs $ tail xs
    let group = [head xs] ++ (map snd $ takeWhile areSequential neighbors)
    [group] ++ (groupSequential $ map snd $ dropWhile areSequential neighbors)

joinRange :: [String] -> String
joinRange x =
    if (length x) > 2 then intercalate "-" [head x, head $ reverse x]
    else unwords x

main :: IO ()
main = do
    _ <- getLine
    line <- getLine
    let groups = groupSequential $ sort $ map toInt $ words line
    putStrLn $ unwords $ map joinRange $ map (\x -> map show x) groups

