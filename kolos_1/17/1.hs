pownum :: Integer -> [Integer]
pownum n = [ x | x <- [1..] , czy_liczba_rowna_sumie n x ]




czy_liczba_rowna_sumie :: Integer -> Integer -> Bool
czy_liczba_rowna_sumie potega liczba = suma_poteg_cyfr == liczba
    where 
        suma_poteg_cyfr = sumujCyfry (show liczba) potega


sumujCyfry :: String -> Integer -> Integer
sumujCyfry [] _ = 0
sumujCyfry (x:rest) potega = ((rozpoznajCyfre x) ^ potega ) + sumujCyfry rest potega



rozpoznajCyfre :: Char -> Integer
rozpoznajCyfre character 
    | character == '0' = 0
    | character == '1' = 1
    | character == '2' = 2
    | character == '3' = 3
    | character == '4' = 4
    | character == '5' = 5
    | character == '6' = 6
    | character == '7' = 7
    | character == '8' = 8
    | character == '9' = 9
    | otherwise        = 0 