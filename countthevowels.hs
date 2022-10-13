isVowel :: Char -> Bool
isVowel c = elem c "aeiouAEIOU"

main :: IO ()
main = do
    line <- getLine
    print $ length $ filter isVowel $ line
