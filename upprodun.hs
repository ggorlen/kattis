makeReducer :: Int -> (Int, [String]) -> a -> (Int, [String])
makeReducer teamsPerRoom (leftOver,result) _ =
    if leftOver > 0 then
        (leftOver - 1, result ++ [replicate (1 + teamsPerRoom) '*'])
    else (0, result ++ [replicate teamsPerRoom '*'])

main :: IO ()
main = do
    rooms <- readLn
    teams <- readLn
    let leftOver = teams `mod` rooms
    let teamsPerRoom = teams `div` rooms
    putStrLn $ reverse $ tail $ reverse $ unlines $ snd $ foldl (makeReducer teamsPerRoom) (leftOver,[]) [1..rooms]
