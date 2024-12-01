


cp :: [Int] -> [Int]
cp perm = [k | k <- [1 ..  length perm], all (\x -> elem x (take k perm)) [1 .. k]]




prefixSublists :: [a] -> [[a]]
prefixSublists lista = foldr (\x acc -> generate x acc) [] lista
  where
    generate x acc = foldr (\prefix rest -> (x : prefix) : rest) [] acc ++ [[x]]

prefixSublists :: [a] -> [[a]]
prefixSublists [] = []
prefixSublists lista = (helper lista) ++ prefixSublists (tail lista)


helper :: [a] -> [[a]]
helper [] = []
helper lista = [lista] ++ helper (init lista)



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

