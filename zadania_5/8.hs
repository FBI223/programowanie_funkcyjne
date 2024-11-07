
eratosthenes :: Int -> [Int]
eratosthenes n = sito n [2..n]


sito :: Int -> [Int] -> [Int]
sito n  [] = []
sito n (x:xs) -- nasz kazdy x jest liczba pierwsza bo juz kilka razy filtrowalismy od 2 do x-1 i nasz x dalej jest w liscie czyli jest liczba pierwsza
    | x * x > n = x : xs  -- jesli po filtrowaniu doszlismy do konca to po prostu doklejasz x do koncowej listy i konczysz
    | otherwise = x : sito n (filtruj x xs) -- usuwanie wszystkich wielokrotnosci x z listy koncowej
-- last xs bierze aktualnie najwyzsza wartosc listy , ( moze byc ale nie musi liczba pierwsza )






eratosthenesRek :: Int -> [Int]
eratosthenesRek n
    | n < 2 = []
    | n == 2 = [2]
    | n > 2 = sitoRek [2..n]

sitoRek :: [Int] -> [Int]
sitoRek  [] = []
sitoRek  (x:xs) -- nasz kazdy x jest liczba pierwsza bo juz kilka razy filtrowalismy od 2 do x-1 i nasz x dalej jest w liscie czyli jest liczba pierwsza
    | x * x > (last xs) = x : xs  -- jesli po filtrowaniu doszlismy do konca to po prostu doklejasz x do koncowej listy i konczysz
    | otherwise = x : sitoRek (filtruj x xs) -- usuwanie wszystkich wielokrotnosci x z listy koncowej
-- last xs bierze aktualnie najwyzsza wartosc listy , ( moze byc ale nie musi liczba pierwsza )


filtruj :: Int -> [Int] -> [Int]
filtruj n arr = filter (\x->x `mod` n /= 0) arr









dzielniki :: Int -> [Int]
dzielniki n = [x | x <- [2..n-1], n `mod` x == 0] 

sumuj_liste :: [Int] -> Int
sumuj_liste [] = 0
sumuj_liste (x:[]) = x
sumuj_liste (x:xs) = x + sumuj_liste xs

czyPierwsza :: Int -> Bool
czyPierwsza n = sumuj_liste (dzielniki n) == 0 


sitko :: Int -> [Int]
sitko n = [x | x <- [2..n] , czyPierwsza x == True  ]


