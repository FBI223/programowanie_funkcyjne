type DirectedGraph = ([Int], Int -> Int -> Bool)


atDistance :: DirectedGraph -> Int -> Int -> [Int]
atDistance dg 0 v = [v]
atDistance (vertices, function) d v = paths
  where
    reachableVertices = filter (\w -> function v w) vertices -- sasiednie wierzcholki
    paths_separated = map (\w -> atDistance (vertices, function) (d - 1) w) reachableVertices 
    paths = concat paths_separated






myGraph1 :: DirectedGraph
myGraph1 = ([1, 2, 3, 4], edgeExists)
  where
    edgeExists :: Int -> Int -> Bool
    edgeExists 1 2 = True
    edgeExists 1 3 = True
    edgeExists 2 4 = True
    edgeExists 3 4 = True
    edgeExists _ _ = False


myGraph2 :: DirectedGraph
myGraph2 = ([1, 2, 3, 4, 5, 6], edgeExists)
  where
    edgeExists :: Int -> Int -> Bool
    edgeExists 1 2 = True
    edgeExists 1 3 = True
    edgeExists 2 4 = True
    edgeExists 2 5 = True
    edgeExists 3 5 = True
    edgeExists 4 6 = True
    edgeExists 5 6 = True
    edgeExists _ _ = False


-- atDistance myGraph1 2 1
-- atDistance myGraph2 3 1
