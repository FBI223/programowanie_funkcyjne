



czyMozliwaWyplata :: Int -> Int -> Int -> Bool
czyMozliwaWyplata a b kwota = nwd a b == 1 || kwota `mod` nwd a b == 0

nwd :: Int -> Int -> Int
nwd a b 
    | reszta_a_b /= 0 = nwd b reszta_a_b
    | otherwise  = b
    where 
        reszta_a_b = mod a b


nww :: Int -> Int -> Int
nww a b = div (a * b) nwd_a_b
    where
        nwd_a_b = (nwd a b)

nww_wiele :: Int -> Int -> Int -> Int
nww_wiele a b c = nww a ( nww b c )

