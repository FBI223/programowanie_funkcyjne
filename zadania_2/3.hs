
--take 10 rozwiazania

rozwiazania = [x | x <- [1..], x `mod` 6 == 1, x `mod` 7 == 4, x `mod` 8 == 3]
-- takie x, ze ...