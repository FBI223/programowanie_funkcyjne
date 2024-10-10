

-- ktora_cwiartka [(1, 2), (-2, 3), (-3, -4), (4, -5), (0, 0), (0, 1)]
-- zlicz_cwiartki [(1, 2), (-2, 3), (-3, -4), (4, -5), (0, 0), (0, 1)]

-- ktora_cwiartka [(2, 2), (-2, 2), (-2, -2), (2, -2), (0, 0)]
-- zlicz_cwiartki [(2, 2), (-2, 2), (-2, -2), (2, -2), (0, 0)]

-- ktora_cwiartka [(0, 0)]
-- zlicz_cwiartki [(0, 0)]

-- ktora_cwiartka punkty
-- zlicz_cwiartki punkty


punkty :: [(Int,Int)]
punkty = [(1, 2), (-1, 3), (-2, -2), (0, 0), (4, -1), (0, 5), (-3, 0)]

czy_w_1 :: (Int, Int) -> Bool
czy_w_1 (x, y) = x >= 0 && y >= 0  -- 1 cw

czy_w_2 :: (Int, Int) -> Bool
czy_w_2 (x, y) = x <= 0 && y >= 0  -- 2 cw

czy_w_3 :: (Int, Int) -> Bool
czy_w_3 (x, y) = x <= 0 && y <= 0  -- 3 cw

czy_w_4 :: (Int, Int) -> Bool
czy_w_4 (x, y) = x >= 0 && y <= 0  -- 4 cw



-- Funkcja zliczająca punkty w każdej ćwiartce
zlicz_cwiartki :: [(Int, Int)] -> (Int, Int, Int, Int)
zlicz_cwiartki [] = (0, 0, 0, 0)  -- baza rekurencji
zlicz_cwiartki (p:ps) = (c1_new, c2_new, c3_new, c4_new)
  where
    (c1, c2, c3, c4) = zlicz_cwiartki ps  -- Rekurencyjne zliczanie punktów z reszty listy

    c1_new
      | czy_w_1 p = c1 + 1
      | otherwise = c1

    c2_new
      | czy_w_2 p = c2 + 1
      | otherwise = c2

    c3_new
      | czy_w_3 p = c3 + 1
      | otherwise = c3

    c4_new
      | czy_w_4 p = c4 + 1
      | otherwise = c4


--    c1_new = if czy_w_1 p then c1 + 1 else c1  -- Aktualizacja licznika dla 1 ćwiartki
--    c2_new = if czy_w_2 p then c2 + 1 else c2  -- Aktualizacja licznika dla 2 ćwiartki
--    c3_new = if czy_w_3 p then c3 + 1 else c3  -- Aktualizacja licznika dla 3 ćwiartki
--    c4_new = if czy_w_4 p then c4 + 1 else c4  -- Aktualizacja licznika dla 4 ćwiartki



-- Funkcja wybierająca ćwiartkę z największą liczbą punktów
cwiartka_max :: (Int, Int, Int, Int) -> Int
cwiartka_max (c1, c2, c3, c4)
  | c1 == 0 && c2 == 0 && c3 == 0 && c4 == 0 = 0  -- Jeśli brak punktów, zwracamy 0
  | c1 >= c2 && c1 >= c3 && c1 >= c4 = 1  -- Jeśli c1 jest największe, zwracamy 1 (pierwsza ćwiartka)
  | c2 >= c1 && c2 >= c3 && c2 >= c4 = 2  -- Jeśli c2 jest największe, zwracamy 2 (druga ćwiartka)
  | c3 >= c1 && c3 >= c2 && c3 >= c4 = 3  -- Jeśli c3 jest największe, zwracamy 3 (trzecia ćwiartka)
  | c4 >= c1 && c4 >= c2 && c4 >= c3 = 4  -- Jeśli c4 jest największe, zwracamy 4 (czwarta ćwiartka)


ktora_cwiartka :: [(Int, Int)] -> Int
ktora_cwiartka punkty = cwiartka_max zliczone_punkty -- funkcja ktora_cwiartka_pomocnicza po prostu wybiera max z krotki oraz zwraca wynik
  where
    zliczone_punkty = zlicz_cwiartki punkty  -- liczymy ile jest wystapien kolejnych punktow w roznych cwiartkach , zwracamy krotke (a,b,c,d)




