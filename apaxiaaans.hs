main :: IO ()
main = do
    line <- getLine
    putStrLn $ reverse $ foldl (\a e -> if (null a) || ((head a) /= e) then (e : a) else a) [] line

