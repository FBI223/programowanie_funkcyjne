
-- map :: (a -> b) -> [a] -> [b]


mapR :: (a -> b) -> [a] -> [b] 
mapR f [] = []
mapR f arr = foldr (\x accu -> ( f x ) : accu  )  [] arr



mapL :: (a -> b) -> [a] -> [b] 
mapL f [] = []
mapL f arr = foldl (\acc x -> acc ++ [f x]) [] arr


mapLL :: (a -> b) -> [a] -> [b]
mapLL f [] = []
mapLL f arr = reverse (foldl (\acc x -> (f x) : acc) [] arr)





