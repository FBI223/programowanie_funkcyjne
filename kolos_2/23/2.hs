dodajPunkty :: Int -> [[Int]] -> [Int]
--dodajPunkty n listaPkt = foldl  (zipWith (+))  (replicate n 0) listaPkt
--dodajPunkty n = foldl  (zipWith (+))  (replicate n 0)
--dodajPunkty n = foldl  (zipWith (+))  (flip replicate 0 n)
dodajPunkty = foldl  (zipWith (+))  . (flip replicate 0 )

--dodajPunkty :: Integer -> [[Integer]] -> [Integer]
--dodajPunkty n listaPkt = foldl (zipWith (+)) (replicate (fromIntegral n) 0) listaPkt

