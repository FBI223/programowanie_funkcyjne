data Tree a = Empty | Node a (Tree a) (Tree a)

treeToListPreOrder :: Tree a -> [a]
treeToListPreOrder Empty = []
treeToListPreOrder (Node val left right) = [val] ++ treeToListPreOrder left ++ treeToListPreOrder right


treeToListInOrder :: Tree a -> [a]
treeToListInOrder Empty = []
treeToListInOrder (Node val left right) = treeToListInOrder left ++ [val] ++ treeToListInOrder right


treeToListPostOrder :: Tree a -> [a]
treeToListPostOrder Empty = []
treeToListPostOrder (Node val left right) = treeToListPostOrder left ++ treeToListPostOrder right ++ [val]

drzewo :: Tree Int
drzewo = Node 10 (Node 4 (Node 2 Empty Empty) Empty) (Node 16 Empty (Node 14 Empty Empty))

-- treeToListPreOrder drzewo 
-- treeToListInOrder drzewo
-- treeToListPostOrder drzewo
