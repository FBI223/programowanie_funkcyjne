
reversing :: [a] -> [a] 
reversing [] = []
reversing (x:xs) = reversing xs ++ [x]


-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b


reverseL :: [a] -> [a] 
reverseL [] = []
reverseL arr = foldl (\x brr -> brr : x  )  [] arr


reverseR :: [a] -> [a] 
reverseR [] = []
reverseR arr = foldr (\x brr -> brr ++ [x]  )  [] arr

