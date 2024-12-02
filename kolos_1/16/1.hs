
przeksztalc :: String -> String
przeksztalc "ab" = "a"
przeksztalc "bb" = "a"
przeksztalc "ba" = "b"
przeksztalc "aa" = "aaa"
przeksztalc literka 
    | length literka == 1           =  literka
    | otherwise                     = "" 


splituj :: String -> [String]
splituj [] = []
splituj (a:b:xs) = ( a : b : [] ) : splituj xs
splituj (a : xs)   =  [a : []]



iteracja :: Int -> String -> [String]
iteracja _ [] = []
iteracja n napis 
    | not (elem 'b' kolejny_napis) || length kolejny_napis < 2   =  [kolejny_napis] 
    | otherwise                                                  =  iteracja (n+1) kolejny_napis
        where 
            splitowany_napis = splituj napis 
            po_iteracji      = map przeksztalc splitowany_napis
            kolejny_napis    = concat po_iteracji


