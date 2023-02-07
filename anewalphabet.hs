import Data.Char (isAlpha, toLower)

convert :: Char -> String
convert x = case x of
    'a' -> "@"
    'n' -> "[]\\[]"
    'b' -> "8"
    'o' -> "0"
    'c' -> "("
    'p' -> "|D"
    'd' -> "|)"
    'q' -> "(,)"
    'e' -> "3"
    'r' -> "|Z"
    'f' -> "#"
    's' -> "$"
    'g' -> "6"
    't' -> "']['"
    'h' -> "[-]"
    'u' -> "|_|"
    'i' -> "|"
    'v' -> "\\/"
    'j' -> "_|"
    'w' -> "\\/\\/"
    'k' -> "|<"
    'x' -> "}{"
    'l' -> "1"
    'y' -> "`/"
    'm' -> "[]\\/[]"
    'z' -> "2"

tryConvert :: Char -> String
tryConvert x =
    if isAlpha x then convert x
    else [x]

main :: IO ()
main = do
    line <- getLine
    putStrLn $ concat $ map tryConvert $ map toLower $ line
