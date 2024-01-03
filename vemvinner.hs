import Data.List (transpose)

split :: Char -> String -> String
split _ [] = []
split char xs =
    if head xs == char then rest
    else [head xs] ++ rest
    where rest = split char (tail xs)

findWinOnRow :: [String] -> String
findWinOnRow [] = "ingen"
findWinOnRow xs =
    if all (\e -> e == 'X' ) $ head xs then "Johan"
    else if all (\e -> e == 'O' ) $ head xs then "Abdullah"
    else findWinOnRow (tail xs)

findWinOnDiagonal :: [String] -> String
findWinOnDiagonal xs =
    if all (\i -> ((xs!!i)!!i) == 'X') [0..len] then "Johan"
    else if all (\i -> ((xs!!i)!!i) == 'O') [0..len] then "Abdullah"
    else "ingen"
    where len = (length xs) - 1

findWinOnOtherDiagonal :: [String] -> String
findWinOnOtherDiagonal xs =
    if all (\i -> xs!!(len - i)!!i == 'X') [0..len] then "Johan"
    else if all (\i -> xs!!(len - i)!!i == 'O') [0..len] then "Abdullah"
    else "ingen"
    where len = (length xs) - 1

result xs =
    if findWinOnRow xs /= "ingen" then findWinOnRow xs
    else if (findWinOnRow $ transpose xs) /= "ingen" then findWinOnRow $ transpose xs
    else if findWinOnDiagonal xs /= "ingen" then findWinOnDiagonal xs
    else if findWinOnOtherDiagonal xs /= "ingen" then findWinOnOtherDiagonal xs
    else "ingen"

main :: IO ()
main = do
    io <- getContents
    let board = map (\e -> split ' ' e) $ lines io
    putStrLn $ (result board) ++ " har vunnit"
