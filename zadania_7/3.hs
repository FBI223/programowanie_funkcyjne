data Tree a = Empty | Node a (Tree a) (Tree a)


drzewoJednoelementowe :: Tree Int
drzewoJednoelementowe = Node 4 Empty Empty

drzewoZerolementowe :: Tree Int
drzewoZerolementowe = Empty

drzewo :: Tree Int
drzewo = Node 10 (Node 4 (Node 2 Empty Empty) Empty) (Node 16 Empty (Node 14 Empty Empty))

isAllEven :: ( Eq a , Integral a ) => Tree a -> Bool
isAllEven Empty = True
isAllEven (Node val left right) = ( isAllEven left ) && ( even val ) && ( isAllEven right )


-- isAllEven drzewo
