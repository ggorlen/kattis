import Data.List (elemIndex)

swapCups :: [Int] -> Char -> [Int]
swapCups pos move
    | move == 'A' = [pos!!1, pos!!0, pos!!2]
    | move == 'B' = [pos!!0, pos!!2, pos!!1]
    | move == 'C' = [pos!!2, pos!!1, pos!!0]
    | otherwise   = error "Illegal move"

main :: IO ()
main = do
    line <- getLine
    print $ 1 + case (elemIndex 1 $ foldl swapCups [1, 0, 0] line) of
        Just value -> value
        Nothing -> error "1 wasn't in the result"
