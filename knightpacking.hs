main :: IO ()
main = do
    n <- readLn
    putStrLn $ if (n `mod` 2) == 0 then "second" else "first"

