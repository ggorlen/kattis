import Data.List (intercalate)

peterPanify :: (Char, Int) -> [String]
peterPanify (x,i) =
    if i `mod` 3 == 2 then
        ["..*.", ".*.*", "*." ++ [x] ++ ".", ".*.*", "..*."]
    else if i `mod` 3 == 0 && i /= 0 then
        ["..#.", ".#.#", "*." ++ [x] ++ ".", ".#.#", "..#."]
    else
        ["..#.", ".#.#", "#." ++ [x] ++ ".", ".#.#", "..#."]

transpose :: [[a]] -> [[a]]
transpose xs = 
    if (length (head xs)) > 0 then
        [map head xs] ++ (transpose $ map tail xs)
    else []

main :: IO ()
main = do
    letters <- getLine
    let withoutLastLine = transpose $ map peterPanify $ zip letters [0..]

    let fill = do
        if length letters `mod` 3 == 0 then "*"
        else "#"

    let withLastLine = map (\(x,i) -> x ++ if i == 2 then [fill] else ["."]) $ zip withoutLastLine [0..]

    putStrLn $ intercalate "\n" $ map concat $ withLastLine
