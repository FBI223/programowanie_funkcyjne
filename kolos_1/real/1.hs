
wyplata :: Int -> Int -> Int -> [Int]
wyplata a b n = [x | x <- [1..n] , elem x mozliwe_sumy ]
    where
        mozliwe_kombinacje = [(a,b) | a <- [0..n] , b <- [0..n]  ]
        mozliwe_sumy = [ pomnoz para a b | para <- mozliwe_kombinacje , pomnoz para a b <= n ,pomnoz para a b > 0   ]


pomnoz :: (Int,Int) -> Int -> Int -> Int
pomnoz (a,b) x y = a*x + b*y


merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys) -- jezeli x jest najmniejsze to daj x na poczatek i zrob polacznie z pozostalymi listami 
    | otherwise = y : merge (x:xs) ys -- jezeli y jest najmniejsze to daj y na poczatek i zrob polacznie z pozostalymi listami 

mergeSort :: [Int] -> [Int]
mergeSort [] = []  -- Pusta lista jest już posortowana
mergeSort [x] = [x]  -- Lista jednoelementowa jest już posortowana
mergeSort xs = merge (mergeSort left) (mergeSort right)  -- Rekurencyjnie sortujemy i łączymy
  where
    mid = length xs `div` 2  -- Znajdujemy środek listy
    (left, right) = splitAt mid xs  -- Dzielimy listę na dwie części


{-
czyMozliwaWyplata :: Int -> Int -> Int -> Bool
czyMozliwaWyplata a b kwota 
    | kwota < 0 = False 
    | kwota == 0 = True
    | kwota > 0 = czyMozliwaWyplata a b (kwota - a) || czyMozliwaWyplata a b (kwota - b)

-}
