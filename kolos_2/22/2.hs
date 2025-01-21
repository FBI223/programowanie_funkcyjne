

f :: [(Int, Int)] -> Int -> Int
--f lista u = (foldl (*) 1 (  map (uncurry (-)) lista )) * u
--f lista u = (*) (foldl (*) 1 (  map (uncurry (-)) lista )) u
--f lista = (*) (foldl (*) 1 (  map (uncurry (-)) lista ))
--f = (  (*) . (foldl (*) 1) ) . (map (uncurry (-)) ) 
f =   (*) . (foldl (*) 1)  . map (uncurry (-)) 

-- tu gdzie sa nawaisy zamiast  (a  (b) ) piszemy (a  . b )
-- ile razy usuwamy zmienne tyle razy mamy (.) 
-- musimy skladac (*) bo usunelismy u
