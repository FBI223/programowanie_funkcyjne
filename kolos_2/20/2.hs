ce :: [[Int]] -> [Int]
--ce xss = concat (filter (\xs -> even (sum xs)) xss)
--ce = concat . (filter (\xs -> even (sum xs)) )
ce = concat . filter (  even . sum )  




-- Testy dla funkcji ce
testCe :: IO ()
testCe = do
    print $ ce [[1,2,3],[2,1],[5,1,1],[],[4,1,1]]
    print $ ce [[1,1],[2,2],[3,3]] 
    print $ ce [[],[1,3],[2,4,6]] 
    print $ ce [[1],[3],[5]] 
    print $ ce [[]]