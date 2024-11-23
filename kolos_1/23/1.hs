cztery :: [Int] -> Int
cztery [] = 0
cztery lista = maximum lista_dlg
    where
        lista_dlg = map length ( podlistyMod4 lista )


podlista_index :: [Int] -> [(Int,Int)]
podlista_index lista = zipWith ( \x y -> (x,y) ) lista [1..]


podlisty :: [(Int,Int)] -> [[(Int,Int)]]
podlisty [] = [[]] 
podlisty (x:xs) = podxs ++ map (x:) podxs 
  where podxs = podlisty xs 


podlistyMod4 :: [Int] -> [[(Int, Int)]]
podlistyMod4 lista =
  filter (\podlista -> (sumuj podlista `mod` 4 == 0) && sprawdzSpojnosc podlista)
  (podlisty (podlista_index lista))

sumuj :: [(Int,Int)] -> Int
sumuj [] = 0 
sumuj ((a,b):xs) = a + (sumuj xs)

sprawdzSpojnosc :: [(Int, Int)] -> Bool
sprawdzSpojnosc lista = all (== 1) (zipWith (\(_, b) (_, d) -> d - b) lista (tail lista))
