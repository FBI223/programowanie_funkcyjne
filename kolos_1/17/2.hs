
ps :: [a] -> [[a]]
ps lista = foldl (\acc x -> acc ++ [take x lista]) [] [1..length lista]
           ++ foldr (\x acc -> (drop x lista) : acc) [] [1..length lista - 1]



sufixy_prefixy :: [a] -> [[a]]
sufixy_prefixy [] = []
sufixy_prefixy lista = pref ++ suf
    where
        suffff  = sufixy_listy lista
        suf     = tail suffff
        pref = reverse $ prefixy_listy lista

sufixy_listy :: [a] -> [[a]]
sufixy_listy [] = []
sufixy_listy lista = lista : sufixy_listy (tail lista)


prefixy_listy :: [a] -> [[a]]
prefixy_listy [] = []
prefixy_listy lista = lista : prefixy_listy (init lista)








{-




prefixSublists :: [a] -> [[a]]
prefixSublists [] = []
prefixSublists lista = (helper lista) ++ prefixSublists (tail lista)


helper :: [a] -> [[a]]
helper [] = []
helper lista = [lista] ++ helper (init lista)  





prefixSublists :: [a] -> [[a]]
prefixSublists [] = []
prefixSublists xs = concatMap tailsFrom (inits xs)
  where
    inits []     = []
    inits (y:ys) = [] : map (y :) (inits ys)

    tailsFrom []     = []
    tailsFrom (y:ys) = (y : ys) : tailsFrom ys

-}
