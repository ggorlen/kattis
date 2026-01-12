-- Wrong answer
import Data.List (elemIndex, nub, sort)
import Data.Maybe (fromJust)

main :: IO ()
main = do
    _ <- getLine
    line <- getLine
    let nums = sort $ map (\x -> read x :: Int) $ words line
    let dupes = nub $ map snd $ filter (\(x,y) -> x == y) $ zip (tail nums ++ [-1]) nums
    let candidates = filter (\e -> not $ e `elem` dupes) nums
    putStrLn $ if null candidates then "none" else show $ fromJust (elemIndex (maximum candidates) nums) - 1
