import Data.List (group, sort)

main :: IO ()
main = do
    line <- getLine
    print $ maximum $ map length $ group $ sort $ map head $ words line

