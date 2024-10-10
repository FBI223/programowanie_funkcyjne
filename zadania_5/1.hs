
onlyUppercase :: String -> String
onlyUppercase [] = []  -- przypadek bazowy: pusta lista zwraca pustą listę
onlyUppercase (x:xs)
    | x >= 'A' && x <= 'Z' = x : onlyUppercase xs  -- jeśli x jest dużą literą, dodaj go do wyniku
    | otherwise            = onlyUppercase xs      -- w przeciwnym razie pomiń ten znak



wielkieLitery :: [String] -> [String]
wielkieLitery [] = []
wielkieLitery lista = map onlyUppercase lista -- filtrujemy za pomoca funkcji wyzej zdefiniowana
                                                -- oraz za pomoca map


