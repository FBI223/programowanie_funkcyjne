
slowaDlugosci :: Char -> Char -> Integer -> [String]
slowaDlugosci a b 0 = [""]
slowaDlugosci a b n =  dodajZnaki a b  ( slowaDlugosci a b  (n-1) )


dodajZnaki :: Char -> Char -> [String] -> [String]
dodajZnaki a b [] = []
dodajZnaki a b (x:xs) =  ( x ++ [a] ) : ( x ++ [b] ) : dodajZnaki a b xs


-- dodaj znaki ab ( dodaj znaki a b ( dodaj znaki a b  "" ))
 --  podwajamy elementyu w liscie dodajac do kazdego slowa albo a albo b na koncu 


-- n razy wykonujemy funkcje dodajZnaki ktora nam za kazdym razem podwaja ilosc
-- elementow w wynikowej liscie , dodaje pokolei albo a albo b do kazdego elementu
-- mamy a b potem a+a oraz a+b oraz b+a oraz b+b




dodajZnaki2 :: Char -> Char -> [String] -> [String]
dodajZnaki2 a b xs = concatMap (\x -> [x ++ [a], x ++ [b]]) xs
-- stosuje map ( funkcja lambda ktora dodaje dla kazdego elementu listy a lub b)
-- potem scala te wszystkir listy w jedna ( wiele podlist w jedna )
-- jedna podlista ma dwa elementy
-- x to element listy
