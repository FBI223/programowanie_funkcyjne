data Rd a = Empty | NodeEmpty a | Node a [Rd a]


el :: Eq a => Rd a -> a -> Bool
el Empty _ = False
el (NodeEmpty element) szukany = element == szukany
el (Node element children) szukany
    | null children = element == szukany
    | otherwise     = element == szukany || any (`el` szukany) children

subst :: Eq a => a -> a -> Rd a -> Rd a
subst _ _ Empty = Empty
subst pierwszy drugi (NodeEmpty element)
    | element == pierwszy = NodeEmpty drugi
    | otherwise           = NodeEmpty element
subst pierwszy drugi (Node element children) = Node podmianka (map (subst pierwszy drugi) children)
  where
    podmianka
        | element == pierwszy = drugi
        | otherwise           = element


rd2list :: Rd a -> [a]
rd2list Empty = []
rd2list (NodeEmpty element) = [element]
rd2list (Node element children) = [element] ++ (concat (map rd2list children))



