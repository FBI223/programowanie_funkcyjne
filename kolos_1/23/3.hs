data Bsk a = Bsk {
    bluszcz :: [a],
    first :: a,
    first_count :: Integer
}


--Bsk {
--    bluszcz = [5, 3, 5],
--    first_index = 0, -- Pierwszy element to `5`, zapisany pod indeksem 0
--    first_count_map = fromList [(0, 2), (1, 1)] -- `5` (indeks 0) występuje 2 razy, `3` (indeks 1) występuje 1 raz
--}


de :: Eq a => Bsk a -> a -> Bsk a
de (Bsk [] _ _) item_in = Bsk [item_in] item_in 1
de (Bsk lista first y) item_in  
    | item_in == first = Bsk (item_in : lista) first (y + 1)
    | otherwise    = Bsk (item_in : lista) first y

oe :: Bsk a -> a
oe (Bsk lista x y) = head lista


ue :: Eq a => Bsk a -> Bsk a
ue (Bsk [] x y) = ( Bsk [] x y )
ue (Bsk lista first y) 
    | lista == []   = Bsk [] first 0
    | tail lista == []     = Bsk [] first 0
    | head lista == first = Bsk (tail lista) first (y - 1)
    | otherwise       = Bsk (tail lista) first y


le :: Eq a => Bsk a -> Integer
le (Bsk [] x y) = 0
le (Bsk lista x y) = y



bsk2l :: Bsk a -> [a]
bsk2l (Bsk [] x y) = []
bsk2l (Bsk lista x y) = reverse lista

