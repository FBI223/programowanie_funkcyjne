

epnp ::(Eq a) => [a] -> [a]
epnp [] = []
epnp lista = lista_parzysta
    where 
        lista_iteracja = zip lista [0..]
        lista_parzysta = [take_first x | x <- lista_iteracja , mod ( take_second x ) 2 == 0]


--epnp :: [a] -> [a]
--epnp [] = []
--epnp lista = [lista !! i | i <- [0..(length lista - 1)], mod i 2 == 1]


take_first :: (a,b) -> a
take_first (x,y) = x

take_second :: (a,b) -> b
take_second (x,y) = y


{-
--zad 1.
--funkcja epnp :: [a] -> [a], treść taka sama jak w 2 terminie z 2022 r. Roznica jedyna, ze zwracamy parzyste pozycje
--np. epnp [1,2,3,4,5] => [2,4]
 
--zad 2.
--funkcja conrev, treść taka sama jak w 2 terminie z 2022 r. Roznica polega na zakazie uzywania funkcji reverse; trzeba zrobic swoja funkcje reverse np. 
odwroc :: [a] -> [a]
odwroc (x : [ ]) = [x]
odwroc lista = [(last lista)] ++ (odwroc (init lista))
odwroc [ ] = [ ]
 
--zad 3.
--funkcja rpoz, ale zwraca w postaci listy trójek [(Int, a, a)] elementy, które mają rozne elementy na tych samych pozycjach
--np. rpoz "smak" "zmok" => [(1, "s", "z"), (3, "a", "o")]
-}