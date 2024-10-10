-- take 10 fibSequence 
-- take 30 fibSequence 

next_fibbo :: (Integer,Integer) -> (Integer,Integer)
next_fibbo (x, y) = (y, x + y)


fib :: (Integer,Integer) -> [(Integer,Integer)]
fib start = iterate next_fibbo start

take_first :: (a, b) -> a
take_first (a,b) = a

fibSequence :: [Integer]
fibSequence = map take_first (fib (0, 1))
