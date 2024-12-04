
wyplata :: Int -> Int -> Int -> [Int]
wyplata a b kwota = [x | x <- [1..kwota], czyMozliwaWyplata a b x]


czyMozliwaWyplata :: Int -> Int -> Int -> Bool
czyMozliwaWyplata a b kwota 
    | kwota < 0 = False 
    | kwota == 0 = True
    | kwota > 0 = czyMozliwaWyplata a b (kwota - a) || czyMozliwaWyplata a b (kwota - b)
