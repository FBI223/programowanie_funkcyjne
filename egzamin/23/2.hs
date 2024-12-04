

--reverse_custom :: [a] -> [a]
--reverse_custom xs = foldl (\acc x -> x : acc) [] xs

--reverse_custom :: [a] -> [a]
--reverse_custom = foldl (\acc x -> (:) x acc) [] 

--reverse_custom :: [a] -> [a]
--reverse_custom = foldl (\acc x -> flip (:) acc x) [] 

--reverse_custom :: [a] -> [a]
--reverse_custom = foldl (\acc -> flip (:) acc) [] 


reverse_custom :: [a] -> [a]
reverse_custom = foldl ( flip (:)) [] 




--reverse_custom :: [a] -> [a]
--reverse_custom xs = foldl (flip (:)) [] xs

--reverse_custom :: [a] -> [a]
--reverse_custom = foldl ( flip (:) ) [] 

--reverse_custom :: [a] -> [a]
--reverse_custom = foldl ( flip (:) ) [] 


conrev :: [[a]] -> [a]
conrev = concat . map reverse_custom




--reverse_custom_foldr :: [a] -> [a]
--reverse_custom_foldr lista = foldr (\x acc -> acc ++ [x]) [] lista


--reverse_custom_foldr :: [a] -> [a]
--reverse_custom_foldr lista = foldr (\x acc -> flip (++) [x] acc ) [] lista


--reverse_custom_foldr :: [a] -> [a]
--reverse_custom_foldr  = foldr (\x -> flip (++) [x] ) [] 

--reverse_custom_foldr :: [a] -> [a]
--reverse_custom_foldr  = foldr (\x -> flip (++) (x : []) ) [] 


--reverse_custom_foldr :: [a] -> [a]
--reverse_custom_foldr  = foldr (\x -> flip (++) ( (: []) x)   ) [] 

reverse_custom_foldr :: [a] -> [a]
reverse_custom_foldr  = foldr (  flip (++) .  (: [])   ) [] 

--reverse_custom_foldr :: [a] -> [a]
--reverse_custom_foldr = foldr (flip (++) . (: [])) []
