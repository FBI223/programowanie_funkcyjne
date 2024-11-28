
wIluListachWystapienia :: Int -> [[Int]] -> [[Int]]
wIluListachWystapienia _ [[]] = [[]]
wIluListachWystapienia n lista_list = map (\lista -> map (\x -> if elem x lista then 1 else 0) [1..n]) lista_list


wIluListach :: Int -> [[Int]] -> [Int]
wIluListach _ [[]] = []
wIluListach n lista_list = foldl  (zipWith (+) ) (replicate n 0) ( wIluListachWystapienia n lista_list )


-- wIluListach 7 [[1,2,3],[3,4,5],[5,6,1],[1,7,4],[3,7,6],[2,7,5],[2,4,6]]
-- -- wIluListach 7 [[1,2,3],[3,4,5]]
