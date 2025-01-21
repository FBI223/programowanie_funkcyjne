-- Funkcja główna: pyta użytkownika o rozmiar choinki i rysuje ją
main :: IO ()
main = do
    putStrLn "Podaj rozmiar choinki (liczba naturalna dodatnia):"
    input <- getLine
    let size = read input :: Int
    if size > 0
        then drawTree size
        else putStrLn "Rozmiar musi być liczbą naturalną dodatnią."

-- Rysowanie całej choinki
drawTree :: Int -> IO ()
drawTree size = do
    drawUpperPart size
    drawLowerPart size
    drawTrunk size

-- Rysowanie górnej części (gałęzie)
drawUpperPart :: Int -> IO ()
drawUpperPart size = sequence_ [putStrLn (drawUpperLine size line) | line <- [1..size]]


-- TA FUNKCJA ponizej ZAMIAST sequence_

-- sequence_ ignoruje wyjscie PROGRAMU 
-- Pomocnicza funkcja dla górnej części
--drawUpperPartHelper :: Int -> Int -> IO ()
--drawUpperPartHelper size line
--    | line > size = return ()
--    | otherwise = do
--        putStrLn (drawUpperLine size line)
--        drawUpperPartHelper size (line + 1)

-- Generowanie jednej linii górnej części
drawUpperLine :: Int -> Int -> String
drawUpperLine size line = spaces ++ "/" ++ slashes ++ backslashes ++ "\\"
  where
    spaces = replicate (size - line) ' '
    slashes = replicate (line - 1) '/'
    backslashes = replicate (line - 1) '\\'


-- Rysowanie dolnej części (podstawa)
drawLowerPart :: Int -> IO ()
drawLowerPart size = do
    let width = 2 * size
    putStrLn (replicate width '^')

-- Rysowanie pnia choinki
drawTrunk :: Int -> IO ()
drawTrunk size = do
    let spaces = replicate (size - 1) ' '
    putStrLn (spaces ++ "||")
