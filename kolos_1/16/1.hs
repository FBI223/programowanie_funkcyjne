
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



{-
trenka 

dlugosc (a:b:x) | isOnlyA (a:b:x) = 0
                | otherwise = 1 + (dlugosc $ iter (a:b:x)) where
    iter ('a':'b':x) = 'a':(iter x)
    iter ('b':'a':x) = 'b':(iter x)
    iter ('b':'b':x) = 'a':(iter x)
    iter ('a':'a':x) = 'a':'a':'a':(iter x)
    iter x = x
    isOnlyA [] = True
    isOnlyA (a:x) = (a == 'a') && (isOnlyA x)
dlugosc _ = 0

-}
