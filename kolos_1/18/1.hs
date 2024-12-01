
rd :: Integer -> [Integer]
rd 1 = [ k | k <- [1..] , (sumaDzielnikow k) == (k + 1)  ]
rd n = [ k | k <- [1.. (n * n)] , (sumaDzielnikow k) == (k + n)  ]

sumaDzielnikow :: Integer -> Integer
sumaDzielnikow liczba = foldl (+) 0 [x | x <- [1..liczba] , mod liczba x == 0 ]

uniqueList :: Eq a => [a] -> [a]
uniqueList [] = []
uniqueList (x:xs)
    | x `elem` xs = uniqueList xs
    | otherwise   = x : uniqueList xs

