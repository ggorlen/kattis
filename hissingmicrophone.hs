{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T

main = do
    line <- getLine
    putStrLn $ if T.isInfixOf "ss" (T.pack line) then "hiss" else "no hiss"

