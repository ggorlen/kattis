import Data.Char (chr, ord)

main :: IO ()
main = do
    line <- getLine
    putStrLn $ tail $ take 2 $ show $ chr $ div (sum $ map ord $ line) (length line)
