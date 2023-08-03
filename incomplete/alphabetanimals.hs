-- FIXME wrong answer
--
-- The problem is likely that there may be chains of forced moves
-- which this solution doesn't account for, e.g.:
--
-- eagle
-- emu
-- umbrella
--  ^ we pick eagle, they're forced to pick emu,
--    then we pick umbrella and they're toast

import Control.Monad (replicateM)

findNextWord :: [String] -> String -> String -> String
findNextWord [] _ _ = []
findNextWord words lastWord ignore =
    if current /= ignore &&
       head current == head (reverse lastWord) then
        current
    else
        findNextWord (tail words) lastWord ignore
    where
        current = head words

main :: IO ()
main = do
    lastWord <- getLine
    n <- readLn
    words <- replicateM n getLine
    let nextWord = findNextWord words lastWord []

    if nextWord == [] then
        putStrLn "?"
    else if findNextWord words nextWord nextWord == [] then
        putStrLn $ nextWord ++ "!"
    else
        putStrLn nextWord
