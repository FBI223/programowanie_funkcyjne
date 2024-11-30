sevens :: Int -> [Int]
sevens ilosc = take ilosc  [ x | x <- [1..] , czy_redukcja_do_7 x ]



redukuj :: Int -> Int
redukuj liczba 
    | length (show suma_cyfr) == 1              =  suma_cyfr
    | otherwise                                 = redukuj suma_cyfr
        where
            suma_cyfr = sumujCyfry (show liczba)



czy_redukcja_do_7 :: Int -> Bool
czy_redukcja_do_7 liczba = redukuj liczba == 7


sumujCyfry :: String -> Int
sumujCyfry [] = 0
sumujCyfry (x:rest) = rozpoznajCyfre x + sumujCyfry rest


rozpoznajCyfre :: Char -> Int
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
    
    