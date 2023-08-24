import Data.List (findIndex, sort)

main :: IO ()
main = do
    a <- getLine
    b <- getLine
    let (n:xx:_) = map (\x -> read x :: Int) $ words a
    let xs = reverse $ sort $ map (\x -> read x :: Int) $ words b
    let idx = findIndex (\(a,b) -> a + b <= xx) $ zip xs (tail xs)
    print $ case idx of
        Nothing  -> 1
        Just idx -> n - idx
