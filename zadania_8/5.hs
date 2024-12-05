
wiekszeOd :: Ord a => [a] -> a -> [a] -- dla > 
--wiekszeOd lista a = [ x | x<-lista, x>a ]
--wiekszeOd lista a = filter (\x -> x>a) lista
--wiekszeOd lista a = filter (\x -> (>) x a  ) lista
--wiekszeOd lista a = filter (\x -> flip (>) a x  ) lista
--wiekszeOd lista a = filter (flip (>) a )  lista
--wiekszeOd lista a = flip filter lista (flip (>) a ) 
--wiekszeOd lista  = (flip filter lista) . (flip (>))  
--wiekszeOd lista  = (.) (flip filter lista) (flip (>))  
--wiekszeOd lista  = flip (.) (flip (>))  (flip filter lista)
wiekszeOd = (flip (.) (flip (>))) . (flip filter)

--wiekszeOd [1, 2, 3, 4, 5] 3


{-

--Zadanie 5
wiekszeOd :: (Ord a) => [a] -> a -> [a]
-- wiekszeOd lista a = [x | x<-lista,x>a]
-- wiekszeOd lista a = filter (\x -> x > a) lista
-- wiekszeOd lista a = flip (\a lista -> (filter ((<) a)) lista) lista a
-- wiekszeOd lista a = flip (\a -> (filter . (<)) a) lista a
-- wiekszeOd lista a = flip (filter . (<)) lista a
wiekszeOd = flip (filter . (<))
 
-}


