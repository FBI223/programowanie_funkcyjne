


greatestCommonDivisor :: Int -> Int -> Int
greatestCommonDivisor a 0 = a
greatestCommonDivisor a b = greatestCommonDivisor b (mod a b)

greatestCommonDivisorInList :: [Int] -> Int
greatestCommonDivisorInList [] = 1
greatestCommonDivisorInList (a:[]) = a
greatestCommonDivisorInList lista = foldl greatestCommonDivisor (head lista) lista


readNumbers :: IO [Int]
readNumbers = do
    input <- getLine
    let inputInt = read input :: Int
    if inputInt == 0
        then return []
        else do
            rest <- readNumbers
            return (inputInt : rest)


main :: IO ()
main = do
    numbers <- readNumbers
    let greatestCommonDivisor = greatestCommonDivisorInList numbers
    putStrLn ("greatestCommonDivisor: " ++ show greatestCommonDivisor)

