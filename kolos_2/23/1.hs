import System.Environment

-- Funkcja określająca wynik pojedynczej rundy
whoWins :: Char -> Char -> Int
whoWins 'P' 'K' = -1
whoWins 'K' 'N' = -1
whoWins 'N' 'P' = -1
whoWins 'K' 'P' = 1
whoWins 'N' 'K' = 1
whoWins 'P' 'N' = 1
whoWins _ _ = 0

-- Funkcja główna
main :: IO ()
main = do
    -- Pobieranie argumentu wejściowego (stringu ruchów komputera)
    (computerMoves:_) <- getArgs
    putStrLn $ "Ruchy komputera: " ++ computerMoves
    
    -- Wywołanie funkcji gry
    playGame computerMoves 0

-- Funkcja obsługująca kolejne rundy gry
playGame :: String -> Int -> IO ()
playGame [] score = do
    putStrLn $ "Gra zakończona! Wynik końcowy: " ++ show score
playGame (computerMove:remainingMoves) score = do
    putStrLn "Podaj swój ruch (P, K, N):"
    playerMove <- getLine
    
    if null playerMove || not (head playerMove `elem` "PKN")
        then playGame (computerMove:remainingMoves) score
        else do
            let result = whoWins (head playerMove) computerMove
            let newScore = score + result
            
            putStrLn $ "Ruch komputera: " ++ [computerMove]
            putStrLn $ "Wynik tej rundy: " ++ case result of
                1 -> "Wygrana!"
                -1 -> "Przegrana!"
                0 -> "Remis!"
            putStrLn $ "Aktualny wynik: " ++ show newScore
            
            -- Rekurencyjne wywołanie dla kolejnej rundy
            playGame remainingMoves newScore