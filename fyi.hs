import Data.List

main :: IO ()
main = do
    line <- getLine
    print $ if isPrefixOf "555" line then 1 else 0
