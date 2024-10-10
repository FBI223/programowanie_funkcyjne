
-- przeksztalcListe kwadrat lista1

kwadrat :: Int -> Int
kwadrat x = x*x


przeksztalcListe :: (Int -> Int) -> [Int] -> [Int]
przeksztalcListe kwadrat [] = []
przeksztalcListe kwadrat (x:xs) = kwadrat x : przeksztalcListe kwadrat xs  -- rek.  funkcja kwadrat

lista1 :: [Int]
lista1 = [1..10]


