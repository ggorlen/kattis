slavkoOct :: String -> Char
slavkoOct x = case x of
    "000" -> '0'
    "001" -> '1'
    "010" -> '2'
    "011" -> '3'
    "100" -> '4'
    "101" -> '5'
    "110" -> '6'
    "111" -> '7'
    _ -> '0'

applySlavkoOct :: String -> String
applySlavkoOct [] = []
applySlavkoOct xs = [slavkoOct $ take 3 xs] ++ (applySlavkoOct $ drop 3 xs)

pad :: String -> String
pad [] = []
pad xs = if length xs `mod` 3 == 0 then xs else pad ("0" ++ xs)

main :: IO ()
main = do
    line <- getLine
    putStrLn $ applySlavkoOct $ pad line
