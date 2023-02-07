import Data.Char (isAlpha, isLower, isUpper)
import Numeric (showFFloat)

count :: (a -> Bool) -> [a] -> Int
count fn xs = length $ filter fn xs

fmtFullPrecision :: Double -> String
fmtFullPrecision x = showFFloat Nothing x ""

main :: IO ()
main = do
    line <- getLine
    let len = fromIntegral $ length line
    let alpha = filter isAlpha line
    let wsCount = fromIntegral $ count (\x -> x == '_') line
    let lowerCount = fromIntegral $ count isLower line
    let upperCount = fromIntegral $ count isUpper line
    putStrLn $ fmtFullPrecision $ wsCount / len
    putStrLn $ fmtFullPrecision $ lowerCount / len
    putStrLn $ fmtFullPrecision $ upperCount / len
    putStrLn $ fmtFullPrecision $ (len - wsCount - lowerCount - upperCount) / len
