-- zip :: [a] -> [b] -> [(a, b)]
-- map :: (a -> b) -> [a] -> [b]
-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]


polacz :: a -> b -> (a,b)
polacz a b = (a,b)

zipp :: [a] -> [b] -> [(a, b)]
zipp arr brr = zipWith polacz arr brr



takeFirst :: ( a -> c ) -> a -> b -> c
takeFirst f a b = f a

mapp :: (a -> b) -> [a] -> [b]
mapp f arr = zipWith ( takeFirst f ) arr arr
-- dla kazdej pary aplikujejmy funkcje f dla pierwszego argumemtu pary 

kwadrat :: Int -> Int
kwadrat a = a*a
