



slowaDlugosci :: Char -> Char -> Integer -> [String]
slowaDlugosci a b 0 = [""]
slowaDlugosci a b n =  dodajZnaki1 a b  ( slowaDlugosci a b  (n-1) )
-- n razy wykonujemy funkcje dodajZnaki ktora nam za kazdym razem podwaja ilosc
-- elementow w wynikowej liscie , dodaje pokolei albo a albo b do kazdego elementu


dodajZnaki1 :: Char -> Char -> [String] -> [String]
dodajZnaki1 a b [] = []
dodajZnaki1 a b (x:xs) =  ( x ++ [a] ) : ( x ++ [b] ) : dodajZnaki a b xs



dodajZnaki2 :: Char -> Char -> [String] -> [String]
dodajZnaki2 a b xs = concatMap (\x -> [x ++ [a], x ++ [b]]) xs
-- stosuje map ( funkcja lambda ktora dodaje dla kazdego elementu listy a lub b)
-- potem scala te wszystkir listy w jedna ( wiele podlist w jedna )
-- jedna podlista ma dwa elementy
-- x to element listy
