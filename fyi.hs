{-# LANGUAGE OverloadedStrings #-}
import Data.Text as T

main :: IO ()
main = do
    line <- getLine
    print $ if T.isPrefixOf "555" (T.pack line) then 1 else 0
