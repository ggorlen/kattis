import Control.Monad (replicateM)

findNthSigns teeth n =
    filter (\(x,_) -> x!!n == '+' || x!!n == '-') teeth

findLeftTeeth teeth = do
    let leftTeeth = findNthSigns teeth 0
    map (\(x,y) -> (head x, head y)) leftTeeth

findRightTeeth teeth = do
    let rightTeeth = findNthSigns teeth 1
    map (\(x,y) -> (head $ reverse x, head y)) $ rightTeeth

canEat :: [(Char, Char)] -> Bool
canEat xs =
    all (\(_,y) -> y /= 'b') xs &&
    8 /= (length $ filter (\(x,_) -> x == '+') xs) &&
    8 /= (length $ filter (\(x,_) -> x == '-') xs)

main :: IO ()
main = do
    n <- readLn
    lines <- replicateM n getLine
    let teeth = map (\(x:y:_) -> (x, y)) $ map words lines

    print $ do
        if canEat $ findLeftTeeth teeth then 0
        else if canEat $ findRightTeeth teeth then 1
        else 2
