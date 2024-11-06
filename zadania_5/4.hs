len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs
    
jeden :: a -> Int
jeden a = 1

dlugosc :: [a] -> Int
dlugosc [] = 0
dlugosc arr = sum ( map jeden arr )


