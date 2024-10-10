-- dzielniki 28
-- dzielniki 5

dzielniki :: Int -> [Int]
dzielniki n = [x | x <- [1..n], n `mod` x == 0]
