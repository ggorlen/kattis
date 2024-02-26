main :: IO ()
main = do
    line <- getLine
    let [a, b, c, d] = map (\x -> read x :: Int) $ words line
    -- TLE, try stepping by the larger of the two candidate numbers
    -- [Is it possible to change the step size of the built-in haskell range function or literal?](https://stackoverflow.com/questions/529625/is-it-possible-to-change-the-step-size-of-the-built-in-haskell-range-function-or)
    print $ length $ filter (\x -> (x `mod` c == 0) && (x `mod` d == 0)) [a..b]

