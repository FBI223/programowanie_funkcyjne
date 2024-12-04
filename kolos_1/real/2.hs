

slowa :: Int -> Int -> [String]
slowa m n = okkk_slowa
    where
        dlugosc_max = m + n
        wszystkie_slowa = concat [slowaDlugosci_ktore_Sa_ok n | n <- [1..dlugosc_max]]
        --ok_slowa = filter (\x -> (zwroc_liczbe_a x <= m) && (zwroc_liczbe_b x <= n)  ) wszystkie_slowa
        okkk_slowa = [x | x <- wszystkie_slowa , (zwroc_liczbe_a x <= m)  , (zwroc_liczbe_b x <= n) , zwroc_liczbe_a x /= zwroc_liczbe_b x  ]




slowaDlugosci_ktore_Sa_ok :: Int -> [String]
slowaDlugosci_ktore_Sa_ok n = lista_slow_ok
    where
        lista_slow = slowaDlugosci 'a' 'b' n
        lista_slow_ok = [ x | x <- lista_slow , czy_ok_struktura x == True  ]

--, zwroc_liczbe_a x <= m , zwroc_liczbe_b x <= n

slowaDlugosci :: Char -> Char -> Int -> [String]
slowaDlugosci a b 0 = [""]
slowaDlugosci a b n =  dodajZnaki a b  ( slowaDlugosci a b  (n-1) )


dodajZnaki :: Char -> Char -> [String] -> [String]
dodajZnaki a b [] = []
dodajZnaki a b (x:xs) =  ( x ++ [a] ) : ( x ++ [b] ) : dodajZnaki a b xs



czy_ok_struktura :: String -> Bool
czy_ok_struktura slowo = (not $ elem 'a' podslowo_b )
    where
        podslowo_a = takeWhile (== 'a') slowo
        podslowo_b  = dropWhile (== 'a') slowo





zwroc_liczbe_a :: String -> Int
zwroc_liczbe_a slowo = length $ filter (=='a') slowo


zwroc_liczbe_b :: String -> Int
zwroc_liczbe_b slowo = length $ filter (=='b') slowo
