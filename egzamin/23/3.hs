rpoz ::(Eq a) => [a] -> [a] -> [(Int,a)]
rpoz [] [] = []
rpoz lista1 lista2 = wynik
    where 
        zzipowana_lista = zip (zip lista1 lista2) [1..]
        zzipowana_lista_poprawione =  map ( \((a,b),liczba) -> (a,b,liczba) ) zzipowana_lista
        zfiltrowane =  filter (\(a,b,c) -> a == b) zzipowana_lista_poprawione
        wynik = map (\(a,b,c) -> (c,b)) zfiltrowane
        

take_first :: (a,a) -> a
take_first (x,y) = x

take_second :: (a,a) -> a
take_second (x,y) = y



