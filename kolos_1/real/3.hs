data Gkt a = Gkt {
    ile_odrzuconych::Int,
    predykat :: (Gkt a -> Bool),
    ogon :: [a]
}





gp :: (Gkt a -> Bool) -> Gkt a
gp predykatt = Gkt {ile_odrzuconych = 0 , predykat = predykatt , ogon = []}

de :: a -> Gkt a -> Gkt a
de element (Gkt ile_odrzuconych  predykat  ogon) = (Gkt ile_odrzuconych_new  predykat  ogon_new)
    where
        czy_odrzucic = predykat (Gkt ile_odrzuconych  predykat  ogon) && ( not $ null ogon )

        ile_odrzuconych_new 
            | czy_odrzucic = ile_odrzuconych + 1
            | otherwise    = ile_odrzuconych

        ogon_new 
            | czy_odrzucic = [element]
            | otherwise    = element : ogon



oe :: Gkt a -> a
oe  (Gkt ile_odrzuconych  predykat  ogon) = head ogon

ue :: Gkt a -> Gkt a
ue (Gkt ile_odrzuconych  predykat  ogon) = (Gkt ile_odrzuconych  predykat  ogon_new)
    where
        ogon_new 
            | null ogon = []
            | otherwise = tail ogon

loo :: Gkt a -> Int
loo (Gkt ile_odrzuconych  predykat  ogon)  = ile_odrzuconych


g2l :: Gkt a -> [a]
g2l (Gkt ile_odrzuconych  predykat  ogon)  = reverse ogon

