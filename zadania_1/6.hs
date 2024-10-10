
-- czyDoskonala 18
-- czyDoskonala 6
-- czyDoskonala 28

dzielniki :: Int -> [Int]
dzielniki n = [x | x <- [1..n-1], n `mod` x == 0] -- robimy liste dzielnikow liczby

sumuj_liste :: [Int] -> Int
sumuj_liste [] = 0
sumuj_liste (x:[]) = x
sumuj_liste (x:xs) = x + sumuj_liste xs

czyDoskonala :: Int -> Bool
czyDoskonala n = sumuj_liste (dzielniki n) == n -- suma tablicy dzielnikow

