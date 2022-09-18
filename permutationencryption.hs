import Control.Monad
import System.Exit

-- https://stackoverflow.com/a/12876438/6243352
group :: Int -> [a] -> [[a]]
group _ [] = []
group n l
    | n > 0 = (take n l) : (group n (drop n l))
    | otherwise = error "Negative or zero n"

-- https://stackoverflow.com/a/20246569/6243352
duplicate :: String -> Int -> String
duplicate s n = concat $ replicate n s

mapIndices :: ([Int],[Char]) -> [Char]
mapIndices (p,g) = map (\i -> (g !! (i - 1))) p

main :: IO ()
main = do
    forM_ [0 .. ] $ \_ -> do
        key <- getLine

        if (head key) == '0' then do exitSuccess
        else do
            s <- getLine
            let perm = tail $ map read $ words key :: [Int]
            let necessarySpace = (length perm) - (mod (length s) (length perm))
            let paddedS = if necessarySpace == (length perm) then s
                else s ++ (duplicate " " necessarySpace)
            let grouped = group (length perm) paddedS
            let perms = replicate (length grouped) perm
            let zipped = zip perms grouped
            putStrLn $ "'" ++ (concat $ map mapIndices zipped) ++ "'"
