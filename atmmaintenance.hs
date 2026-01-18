main :: IO ()
main = do
    line <- getLine
    let [n, total] = map (\x -> read x :: Int) $ words line
    line <- getLine
    let amounts = map (\x -> read x :: Int) $ words line
    putStrLn $ fst $ foldl (\(a, total) e -> if total - e < 0 then (a ++ "0", total) else (a ++ "1", total - e)) ("", total) $ amounts
