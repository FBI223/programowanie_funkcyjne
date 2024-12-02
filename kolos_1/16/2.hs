val :: Integer -> Integer -> Integer
val a b
  | a > 0 && b > 1 = maxVal
  | otherwise = error "Invalid input: a must be > 0 and b must be > 1"
  where
    powers = takeWhile (\x -> x <= a && mod a x == 0) [b^n | n <- [0..]]
    maxVal = if null powers then 0 else fromIntegral (length powers - 1)



g :: Integer -> Integer -> [Integer]
g k v = filter (\n -> val n k == v) [2..]




