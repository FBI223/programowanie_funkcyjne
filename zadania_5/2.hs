
-- string to tablica tak naprawde
czy_takie_same :: String -> String -> Bool
czy_takie_same [] [] = True  -- oba napisy są puste, są takie same
czy_takie_same [] _  = False -- pierwszy napis jest pusty, drugi nie, więc są różne
czy_takie_same _ []  = False -- pierwszy napis nie jest pusty, a drugi jest, więc są różne
czy_takie_same (x:xs) (y:ys)
    | x == y    = czy_takie_same xs ys  -- jeśli pierwszy znak jest taki sam, porównujemy resztę
    | otherwise = False                 -- znaki różnią się, więc napisy są różne


--czy_palindrom :: String -> Bool
--czy_palindrom [] = False
--czy_palindrom s_in = czy_takie_same s_in ( reverse s_in ) -- czy palindrom to wynik funkcji ktora porownuje 
                                                                -- czy odwrocony string rowna sie zwykly string


czy_palindrom :: String -> Bool
czy_palindrom [] = False
czy_palindrom s_in = s_in == ( reverse s_in ) 


dlugoscPalindromow :: [String] -> Int
dlugoscPalindromow lista = sum (map length (filter czy_palindrom lista)) -- filtrujemy liste zeby byly palondromy tylko
                                                                        -- mapujemy ( przypisujemy ) elementom listy ich dligosci i na koniec zliczamy sume

zwroc_palindromy :: [String] -> [String]
zwroc_palindromy [] = []
zwroc_palindromy lista = filter czy_palindrom lista












