import Control.Monad
import Text.Printf

main :: IO ()
main = do
    n <- readLn
    forM_ [1 .. n] $ \i -> do
        line <- getLine
        let (b:p:_) = map read $ words line :: [Float]
        let rng = 60 / p
        let bpm = 60 * b / p
        putStrLn $ printf "%f %f %f" (bpm - rng) bpm (bpm + rng)
