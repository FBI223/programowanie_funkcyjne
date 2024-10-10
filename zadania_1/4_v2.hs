

iloczyn_lista :: [Integer] -> Integer
iloczyn_lista [] = -1 
iloczyn_lista (x:[]) = x
iloczyn_lista (x:xs) = x * iloczyn_lista xs

silnia_1000 :: Integer
silnia_1000 = iloczyn_lista [1..1000]


