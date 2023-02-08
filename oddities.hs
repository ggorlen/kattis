import Control.Monad (replicateM)

pop :: [a] -> [a]
pop = reverse . tail . reverse

isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

main :: IO ()
main = do
    n <- readLn
    lines <- replicateM n readLn
    putStrLn $ pop $ unlines $ map (\x -> show x ++ (if isEven x then " is even" else " is odd")) lines
