-- crashes on test case 4, can I fuzz test the inputs? or rewrite in a normal lang

import Data.Char (chr, ord)
import Data.List (intercalate)
import qualified Data.Text as T

toInt :: String -> Int
toInt x = read x :: Int

lineToInts :: String -> [Int]
lineToInts x = map toInt $ words x

findSticker char i sticker x y = do
    let (w:h:c:r:_) = sticker
    if x >= c && x < (w + c) && y >= r && y < (h + r) then (chr (i + (ord 'a'))) else char

main :: IO ()
main = do
    io <- getContents
    let board = map lineToInts $ lines io
    let w:h:_ = head board
    let stickers = tail board
    putStrLn $ intercalate "\n" $ map (\y -> map (\x -> foldl (\char (i,sticker) -> findSticker char i sticker x y) '_' (zip [0..] stickers)) [0..(w - 1)]) [0..(h - 1)]
