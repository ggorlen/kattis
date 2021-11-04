import Data.List

main = do
    line <- getLine
    let split = words line
    putStrLn $ (\b -> if b then "yes" else "no") ((length (nub split)) == length split)
