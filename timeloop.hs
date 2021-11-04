count 0 = return ()
count n = do
    count (n - 1)
    putStrLn $ (show n) ++ " Abracadabra"

main = do
    line <- getLine
    count (read line :: Integer)

