import Data.String

fizzBuzz :: Int -> Int -> Int -> String
fizzBuzz x y n | n `mod` x == 0 && n `mod` y == 0 = "FizzBuzz"
               | mod n x == 0 = "Fizz"
               | mod n y == 0 = "Buzz"
               | otherwise = show n

printFizzBuzzToN x y 0 = return ()
printFizzBuzzToN x y n =
    do
        printFizzBuzzToN x y (n - 1)
        putStrLn (fizzBuzz x y n)

main = do
    line <- getLine
    let splitLine = words line
    let vals = map read $ splitLine :: [Int]
    let x = vals!!0
    let y = vals!!1
    let n = vals!!2
    printFizzBuzzToN x y n

