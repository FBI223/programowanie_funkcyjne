


--data Wnr a = Empty | Node [a] ( Wnr a )
-- data Wnr a = Wnr { current :: [a], previous :: [[a]] }
data Wnr a = Wnr { lista :: [[a]] }



wp :: Wnr a
wp = Wnr ( [[]] )

dl :: Num a => Wnr a -> a -> Wnr a
dl (Wnr (current : rest)) liczba = Wnr ((liczba : current) : rest)
dl (Wnr []) liczba = Wnr [[liczba]]  

ts :: Wnr a -> Wnr a
ts (Wnr (current : rest))
    | not ( null current) = Wnr ([] : current : rest) 
    | otherwise     = Wnr (current : rest)  

wmax :: (Ord a) => Wnr a -> [a]
wmax (Wnr []) = []  
wmax (Wnr (current : rest))
    | not (null current) =  ( (maximum  current) : wmax (Wnr rest) )
    | otherwise = wmax (Wnr rest )

wmin ::(Ord a) => Wnr a -> [a]
wmin (Wnr []) = [] 
wmin (Wnr (current : rest))
    | not (null current) =  ( (minimum current) : wmin (Wnr rest) )
    | otherwise = wmin (Wnr rest )






-- Testy w funkcji `main`
main :: IO ()
main = do
    let wpp = wp                       -- Pusty wieloszczet
    let w1 = dl wpp 10                 -- Wnr [[10]]
    let w2 = dl w1 20                  -- Wnr [[20, 10]]
    let w3 = ts w2                     -- Wnr [[], [20, 10]]
    let w4 = dl w3 30                  -- Wnr [[30], [20, 10]]

    -- Obliczanie maksimum i minimum
    print (wmax w4)                    -- Powinno dać: [30, 20]
    print (wmin w4)                    -- Powinno dać: [30, 10]
