


cp :: [Int] -> [Int]
cp perm = [k | k <- [1 ..  length perm], all (\x -> elem x (take k perm)) [1 .. k]]



-- Funkcja permutacje: generuje wszystkie permutacje listy
permutacje :: [Integer] -> [[Integer]]
permutacje [] = [[]] -- Permutacja pustej listy to lista zawierająca pustą listę
permutacje xs = [x : ps | x <- xs, ps <- permutacje (remove x xs)]
  where
    -- Usuwa pierwszy wystąpienie elementu z listy
    remove _ [] = []
    remove y (z:zs)
      | y == z    = zs
      | otherwise = z : remove y zs

