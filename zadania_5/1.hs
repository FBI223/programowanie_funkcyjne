
onlySmall :: String -> String
onlySmall [] = []  -- przypadek bazowy: pusta lista zwraca pustą listę
onlySmall (x:xs)
    | x >= 'a' && x <= 'z' = x : onlySmall xs  -- jeśli x jest mala literą, dodaj go do wyniku
    | otherwise            =     onlySmall xs      -- w przeciwnym razie pomiń ten znak



maleLitery :: [String] -> [String]
maleLitery [] = []
maleLitery lista = map onlySmall lista -- filtrujemy za pomoca funkcji wyzej zdefiniowana
                                                -- oraz za pomoca map


maleLiteryy :: [String] -> [String]
maleLiteryy lista = map (\x -> filter (`elem` ['a'..'z']) x) lista

