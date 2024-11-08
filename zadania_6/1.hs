
lista :: [Int]
lista = [1,2,3,(-4),5,(-6)]



-- ghci> foldr (-) 0 lista
-- 17
-- ghci> foldl (-) 0 lista
-- -1
