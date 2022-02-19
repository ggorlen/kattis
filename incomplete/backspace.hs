-- FIXME memory limit exceeded
backspace ::  ([Char], Int) -> Char -> ([Char], Int)
backspace (result, countToRemove) character =
    if character == '<' then (result, countToRemove + 1)
    else if countToRemove > 0 then (result, countToRemove - 1)
    else ((result ++ [character]), countToRemove)

main :: IO ()
main = do
    line <- getLine
    putStrLn $ reverse $ fst $ (foldl backspace ("", 0) (reverse line))

