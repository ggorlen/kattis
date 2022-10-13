main :: IO ()
main = do
  line <- getLine
  putStrLn $ dropWhile (/= 'a') line
