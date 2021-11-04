import Control.Monad

main :: IO ()
main = do
    n <- readLn
    forM_ [1..n] $ \i -> do
        line <- getLine
        putStr $ if i `mod` 2 == 1 then line ++ "\n" else ""

