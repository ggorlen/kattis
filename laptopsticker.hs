toInt :: String -> Int
toInt x = read x :: Int

lineToInts :: String -> [Int]
lineToInts x = map toInt $ words x

toTuple :: [a] -> (a,a,a,a)
toTuple [a,b,c,d] = (a,b,c,d)

main :: IO ()
main = do
    line <- getLine
    let (wc,hc,ws,hs) = toTuple $ lineToInts line
    print $ if (wc >= (ws + 2)) && (hc >= (hs + 2)) then 1 else 0
