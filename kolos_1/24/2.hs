


collatz_petla :: Integer -> [Integer] -> [Integer]
collatz_petla 1 accu = 0 : accu
collatz_petla n accu = collatz_petla (n - 1) (fromIntegral (length (collatz_rek n [])) : accu)


collatz_temp :: Integer -> Integer
collatz_temp x
    | mod x 2 == 0 = x `div` 2
    | mod x 2 /= 0 = 3*x+1

collatz_rek :: Integer -> [Integer] -> [Integer] 
collatz_rek 1 accu =  accu
collatz_rek n accu = collatz_rek ( collatz_temp n ) (n : accu)  