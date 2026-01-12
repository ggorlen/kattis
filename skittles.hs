-- TODO: make less terrible

idx :: Char -> Int
idx x = case x of
    'R' -> 0
    'O' -> 1
    'Y' -> 2
    'G' -> 3
    'P' -> 4

convert :: Int -> String
convert x = case x of
    0 -> "R"
    1 -> "O"
    2 -> "Y"
    3 -> "G"
    4 -> "P"
    _ -> ""

increment :: [Int] -> Int -> [Int]
increment a i =
    (take i a) ++ [(a!!i) + 1] ++ (drop (i + 1) a)

main :: IO ()
main = do
    skittles <- getLine
    let counts = foldl (\a e -> increment a (idx e)) [0, 0, 0, 0, 0] skittles
    let (_, xx) = foldl (\(a, result) i -> (map (\e -> (e - (if (length $ filter (\x -> x > 0) a) == (5 - i) then minimum (filter (\x -> x > 0) a) else 0))) a,
                           result ++ [((length $ filter (\x -> x > 0) a) == (5 - i), if (length $ filter (\x -> x > 0) a) == (5 - i) then minimum (filter (\x -> x > 0) a) else 0, map (\e -> (e - (if (length $ filter (\x -> x > 0) a) == (5 - i) then minimum (filter (\x -> x > 0) a) else 0))) a)])) (counts, []) [0..((length counts) - 1)]
    let xxx = concat $ map (\(shouldInclude, count, elms) -> if shouldInclude then ((show count) ++ (if shouldInclude then " " else "") ++ (concat $ map (\(i, x) -> if x >= 0 then convert i else "") $ zip [0..] elms) ++ "\n") else "0\n") xx
    putStrLn $ take ((length xxx) - 1) xxx
