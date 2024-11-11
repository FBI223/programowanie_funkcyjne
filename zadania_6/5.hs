

czy_w_1 :: (Int, Int) -> Bool
czy_w_1 (x, y) = x >= 0 && y >= 0  -- 1 cw

czy_w_2 :: (Int, Int) -> Bool
czy_w_2 (x, y) = x <= 0 && y >= 0  -- 2 cw

czy_w_3 :: (Int, Int) -> Bool
czy_w_3 (x, y) = x <= 0 && y <= 0  -- 3 cw

czy_w_4 :: (Int, Int) -> Bool
czy_w_4 (x, y) = x >= 0 && y <= 0  -- 4 cw




identyfilkuj_pkt :: (Int, Int) -> (Int, Int, Int, Int)
identyfilkuj_pkt pkt= (c1_new, c2_new, c3_new, c4_new)
  where
    c1_new
      | czy_w_1 pkt = 1
      | otherwise = 0

    c2_new
      | czy_w_2 pkt = 1
      | otherwise = 0

    c3_new
      | czy_w_3 pkt = 1
      | otherwise = 0

    c4_new
      | czy_w_4 pkt = 1
      | otherwise = 0



mapR :: (a -> b) -> [a] -> [b] 
mapR f [] = []
mapR f arr = foldr (\x accu -> ( f x ) : accu  )  [] arr


sumujTuple :: (Int,Int,Int,Int) -> (Int,Int,Int,Int) -> (Int,Int,Int,Int)
sumujTuple (c1,c2,c3,c4) (d1,d2,d3,d4) = ( c1+d1 , c2+d2 , c3+d3 , c4+d4 )



-- Funkcja wybierająca ćwiartkę z największą liczbą punktów
cwiartka_max :: (Int, Int, Int, Int) -> Int
cwiartka_max (c1, c2, c3, c4)
  | c1 == 0 && c2 == 0 && c3 == 0 && c4 == 0 = 0  -- Jeśli brak punktów, zwracamy 0
  | c1 >= c2 && c1 >= c3 && c1 >= c4 = 1  -- Jeśli c1 jest największe, zwracamy 1 (pierwsza ćwiartka)
  | c2 >= c1 && c2 >= c3 && c2 >= c4 = 2  -- Jeśli c2 jest największe, zwracamy 2 (druga ćwiartka)
  | c3 >= c1 && c3 >= c2 && c3 >= c4 = 3  -- Jeśli c3 jest największe, zwracamy 3 (trzecia ćwiartka)
  | c4 >= c1 && c4 >= c2 && c4 >= c3 = 4  -- Jeśli c4 jest największe, zwracamy 4 (czwarta ćwiartka)


ktoraCwiartka :: [(Int, Int)] -> Int
ktoraCwiartka coordinates = cwiartka_max (foldr sumujTuple (0, 0, 0, 0) (mapR identyfilkuj_pkt coordinates))

