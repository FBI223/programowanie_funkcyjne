data Bsk a = Bsk {
    bluszcz :: [a],
    first :: a,
    first_count :: Integer
}



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



{-
data Bsk a = Empty | El [a] a Integer
 
deriving instance (Show a) => Show (Bsk a)
 
de :: (Eq a) => Bsk a -> a -> Bsk a
de Empty x = El [x] x 1
de (El els fs count) x = El (x : els) fs (if fs == x then count + 1 else count)
 
oe :: Bsk a -> a
oe (El (el : els) fs count) = el
 
ue :: (Eq a) => Bsk a -> Bsk a
ue (El (el : els) fs count) = El els fs (if el == fs then count - 1 else count)
 
le :: (Eq a) => Bsk a -> Integer
le (El _ _ count) = count
 
bsk2l :: Bsk a -> [a]
bsk2l (El els _ _) = els

-}