
-- mergeSort lista1 
-- mergeSort lista2 
-- mergeSort lista3 
-- mergeSort lista4 
-- mergeSort lista5 

lista1 :: [Int]
lista1 = [38, 27, 43, 3, 9, 82, 10, 101, 42]

lista2 :: [Int]
lista2 = [2,1]

lista3 :: [Int]
lista3 = [101]

lista4 :: [Int]
lista4 = []


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

