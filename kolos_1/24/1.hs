slowaDlugosci :: Char -> Char -> Char -> Int -> [String]
slowaDlugosci a b c 0 = [""]
slowaDlugosci a b c n =  dodajZnaki a b c  ( slowaDlugosci a b c (n-1) )


dodajZnaki :: Char -> Char -> Char  -> [String] -> [String]
dodajZnaki a b c [] = []
dodajZnaki a b c (x:xs) =  ( x ++ [a] ) : ( x ++ [b] ) : ( x ++ [c] ) : dodajZnaki a b c xs







czy_a :: Char -> Int
czy_a x 
    | x == 'a' = 1
    | otherwise = 0

czy_b :: Char -> Int
czy_b x 
    | x == 'b' = 1
    | otherwise = 0

czy_c :: Char -> Int
czy_c x 
    | x == 'c' = 1
    | otherwise = 0


sprawdz_liczbe_liter :: String -> (Int, Int , Int) -> (Int , Int , Int)
sprawdz_liczbe_liter [] (a,b,c) = (a,b,c)
sprawdz_liczbe_liter (x:xs) (a1,b1,c1) = sprawdz_liczbe_liter xs (a2,b2,c2)
    where
        a2 = a1 + czy_a x
        b2 = b1 + czy_b x
        c2 = c1 + czy_c x


sprawdz :: String -> Bool
sprawdz [] = False
sprawdz s_in = 2*a == b + c
    where
        (a,b,c) = sprawdz_liczbe_liter s_in (0,0,0)


generuj :: Int -> [String]
generuj 0 = []
generuj n = filter sprawdz ( slowaDlugosci 'a' 'b' 'c' (3* n) )

