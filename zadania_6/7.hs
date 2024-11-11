fibonacci :: [Integer]
fibonacci = 0 : 1 : (zipWith (+) fibonacci (tail fibonacci))

--fibonacci: [0, 1, ...]
--tail fibonacci: [1, ...]
--zipWith (+) fibonacci (tail fibonacci): [0 + 1, 1 + 1 , 1 + 2 ...... ] = [1, 2 , 3 , 5 ...]


