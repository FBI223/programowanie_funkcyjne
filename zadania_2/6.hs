

-- podlisty [2, 3]
-- podlistyDlugosci 4 [1,2,3,4]
-- podlistyDlugosci 4 [1,2,3,4,5]
-- podlistyDlugosci 1 [1,2,3,4,5]
-- podlistyDlugosci 0 [1,2,3,4,5]

--Dla podlisty [2, 3]:
--podxs = [[], [3]]
--map (2:) podxs = [[2], [2, 3]]
--Wynik: [[], [3], [2], [2, 3]]



podlisty :: [Integer] -> [[Integer]]
podlisty [] = [[]] -- przypadek bazowy ,       ++ laczy dwie listy ,      "map (x:) podxs" -> map stosuje funkcje (x:) dla podxs
podlisty (x:xs) = podxs ++ map (x:) podxs -- rekurencja , "map (x:) podxs" tworzy dla kazdej podlisty z podxs dodaje na poczatek element x
  where podxs = podlisty xs -- podxs to wszystkie podlisty 'ogona' podanej listy , wywolanie rek. ... 


maDlugosc :: Integer -> [Integer] -> Bool
maDlugosc k ys = fromIntegral (length ys) == k -- konwersja z Int na Integer, bo lenght zwraca Int 

podlistyDlugosci :: Integer -> [Integer] -> [[Integer]]
podlistyDlugosci k xs = filter (maDlugosc k) (podlisty xs) 
-- bierzemy wszystkkie listy mozliwe i stosujemy filtr 'maDlugosc' dla wszystkich mozliwych podlist oraz zwracamy te podlisty


