import Control.Monad

cardValueDominant :: Char -> Int
cardValueDominant x = case x of
    'A' -> 11
    'K' -> 4
    'Q' -> 3
    'J' -> 20
    'T' -> 10
    '9' -> 14
    _   -> 0

cardValueNonDominant :: Char -> Int
cardValueNonDominant x
    | x == 'A'  = 11
    | x == 'K'  = 4
    | x == 'Q'  = 3
    | x == 'J'  = 2
    | x == 'T'  = 10
    | otherwise = 0

cardValue :: Char -> Char -> Char -> Int
cardValue card suit dominantSuit = 
    if suit == dominantSuit
    then cardValueDominant card
    else cardValueNonDominant card

main :: IO ()
main = do
    line <- getLine
    let lineSplit = words line
    let n = read $ head $ lineSplit
    let b = head (lineSplit!!1)
    cards <- replicateM (n * 4) getLine
    print $ sum $ map (\(card:suit:_) -> cardValue card suit b) $ cards

