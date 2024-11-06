
eratosthenes :: Int -> [Int]
eratosthenes n = sitoRek [2..n]



sitoRek :: [Int] -> [Int]
sitoRek  [] = []
sitoRek  (x:xs) -- nasz kazdy x jest liczba pierwsza bo juz kilka razy filtrowalismy od 2 do x-1 i nasz x dalej jest w liscie czyli jest liczba pierwsza
    | x * x > (last xs) = x : xs  -- jesli po filtrowaniu doszlismy do konca to po prostu doklejasz x do koncowej listy i konczysz
    | otherwise = x : sitoRek (filtruj x xs) -- usuwanie wszystkich wielokrotnosci x z listy koncowej


filtruj :: Int -> [Int] -> [Int]
filtruj n arr = filter (\x->x `mod` n /= 0) arr




