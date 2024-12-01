repl :: Eq a => [a] -> [(a, a)] -> [a]
repl [] _ = []
repl (x:xs) lista_zamianka = zamianka x lista_zamianka : repl xs lista_zamianka




repl2 :: Eq a => [a] -> [(a, a)] -> [a]
repl2 lista lista_zamianka = foldl (\acc x -> acc ++ [zamianka x lista_zamianka]) [] lista

repl3 :: Eq a => [a] -> [(a, a)] -> [a]
repl3 lista lista_zamianka =  reverse $ foldl (\acc x ->  (zamianka x lista_zamianka) : acc ) [] lista



zamianka ::  Eq a => a -> [(a,a)] -> a
zamianka element [] = element
zamianka element ((y1,y2):ys)
    | element == y1        = y2
    | otherwise            = zamianka element ys





mapL :: (a -> b) -> [a] -> [b] 
mapL f [] = []
mapL f arr = foldl (\acc x -> acc ++ [f x]) [] arr

