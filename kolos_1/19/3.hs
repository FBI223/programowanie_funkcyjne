
{-

Jak to działa:
iterate f x generuje:
[x,f(x),f(f(x)),f(f(f(x))),…]

-}

-- o 1 w lewo
przesuniecieCykliczne :: [a] -> [a]
przesuniecieCykliczne [] = []
przesuniecieCykliczne (x:xs) = xs ++ [x]









cykl :: [a] -> [[a]]
cykl [] = [[]]
cykl lista = take n ( iterate przesuniecieCykliczne lista )
    where 
        n = length lista


cyklGood :: [a] -> [[a]]
cyklGood lista = foldl (\acc _ ->  przesuniecieCykliczne (head acc) : acc ) [lista] (tail lista)


