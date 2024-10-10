
-- jestPunktemStalym 10 f1
-- jestPunktemStalym 10 f2
-- jestPunktemStalym 0 f2 


jestPunktemStalym :: (Eq a) => a -> (a -> a) -> Bool -- eq a , mozna porownac typ 'a' z inna zmienna typu 'a' 
jestPunktemStalym x f = f x == x -- bierzemy wartosc i funkcje w argumencie

f1 :: Int -> Int
f1 x = x

f2 :: Int -> Int
f2 x = x * x