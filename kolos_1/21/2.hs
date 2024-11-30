data Tree a = Empty | Node a (Tree a) (Tree a)
drzewo = Node 10 (Node 5 (Node 4 Empty Empty) (Node 6 Empty Empty)) (Node 20 Empty (Node 11 Empty Empty))

--findPath 6 drzewo
-- = [10,5,6]

--findPath 7 drzewo
-- = [].


{-
findPath :: Eq a => a -> Tree a -> [a]
findPath _ Empty = []  -- Jeśli drzewo jest puste, zwracamy pustą listę
findPath destination (Node val left right)
    | destination == val = [val]  -- Znaleźliśmy wartość, zwracamy ścieżkę z tym elementem
    | not (null leftPath) = val : leftPath  -- Jeśli znaleźliśmy ścieżkę w lewym poddrzewie, dołączamy bieżący węzeł
    | not (null rightPath) = val : rightPath  -- Jeśli znaleźliśmy ścieżkę w prawym poddrzewie, dołączamy bieżący węzeł
    | otherwise = []  -- Nie znaleźliśmy wartości w tym drzewie
  where
    leftPath = findPath destination left
    rightPath = findPath destination right
-}

isTreeEmpty :: Tree a -> Bool
isTreeEmpty (Node val left right) = False
isTreeEmpty Empty                 = True


findPath :: Eq a => a -> Tree a -> [a]
findPath _ Empty = []  -- Jeśli drzewo jest puste, zwracamy pustą listę
findPath destination (Node val left right) 
    | destination == val                                             = [val]
    | isTreeEmpty left && isTreeEmpty right && destination /= val    = []
    | destination /= val && (not (isTreeEmpty left)  || not (isTreeEmpty right) )  = dobra_droga
        where
            lewa_droga  = val : findPath destination left
            prawa_droga = val : findPath destination right

            lewa_droga_new
                | null (tail lewa_droga) = []
                | otherwise            = lewa_droga


            prawa_droga_new
                | null (tail prawa_droga) = []
                | otherwise             = prawa_droga

            dobra_droga
                | not (null lewa_droga_new) = lewa_droga_new
                | otherwise               = prawa_droga_new



