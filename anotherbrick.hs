useBrick :: (Bool, Int, Int, Int) -> Int -> (Bool, Int, Int, Int)
useBrick (result,w,h,currW) brick = do
    if h < 1 then (True,0,0,0)
    else if (not result) || (currW + brick > w) then (False,0,1,0)
    else if currW + brick < w then (True,w,h,currW + brick)
    else (True,w,h - 1,0)

first :: (a,b,b,b) -> a
first (x,_,_,_) = x

canChooseBricks :: Int -> Int -> [Int] -> Bool
canChooseBricks w h bricks = first $ foldl useBrick (True,w,h,0) bricks

wordsToInts :: String -> [Int]
wordsToInts s = map (\x -> read x :: Int) $ words s

main :: IO ()
main = do
    line1 <- getLine
    line2 <- getLine
    let (h:w:_) = wordsToInts line1
    let bricks = wordsToInts line2
    putStrLn $ if canChooseBricks w h bricks then "YES" else "NO"
