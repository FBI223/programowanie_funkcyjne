--data Sdb a = SingleValue a | Node a (Sdb a)  (Sdb a) deriving (Eq, Show)

data Sdb a = Empty | Node a (Sdb a)  (Sdb a) deriving (Eq, Show)

el :: Eq a => Sdb a -> a -> Bool
el Empty _ = False
el (Node value left_sub right_sub ) szukany 
    | value == szukany  = True
    | otherwise         = el left_sub szukany || el right_sub szukany


eq :: Eq a => Sdb a -> Sdb a -> Bool
eq Empty Empty = True
eq (Node v1 l1 r1) (Node v2 l2 r2)
    | v1 == v2  = (eq l1 l2 && eq r1 r2) || (eq l1 r2 && eq r1 l2)
    | otherwise = False
eq _ _ = False



sdb2list :: Sdb a -> [a]
sdb2list drzewo = bfsQueue [drzewo]


bfsQueue :: [Sdb a] -> [a]
bfsQueue [] = []
bfsQueue ( (Empty) : rest_trees_in_queue) = bfsQueue rest_trees_in_queue
bfsQueue ((Node value left right) : rest_trees_in_queue) = value : bfsQueue (rest_trees_in_queue ++ [left, right])



tree :: Sdb Int
tree = Node 1 (Node 2 (Node 4 Empty Empty) Empty) (Node 3 Empty Empty)

main :: IO ()
main = do
    print $ sdb2list tree  -- [1, 2, 3, 4]


{-

data Sda a = Single_val a | Sda {
    value :: a,
    lewy :: Sda a,
    prawy :: Sda a
}

data Sda0 a = Sda0 {
    value :: a,
    lewy :: Maybe (Sda0 a),
    prawy :: Maybe (Sda0 a)
} deriving (Show)



data Sda1 a = Null
           | Sda1 {
               value :: a,
               lewy :: Sda1 a,
               prawy :: Sda1 a
           } deriving (Show)


data Sdb2 a = Node a [Sdb2 a]

-}



