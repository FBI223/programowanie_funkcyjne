dlaKazdego :: (a -> Bool) -> [a] -> Bool
dlaKazdego f arr = foldr (\x accu -> f x && accu) True arr

istnieje :: (a -> Bool) -> [a] -> Bool
istnieje f arr = foldr (\x accu -> f x || accu) False arr



parzysta :: Int -> Bool
parzysta x = mod x 2 == 0


dlaKazdego2 :: (a -> Bool) -> [a] -> Bool
dlaKazdego2 f arr = all f arr

istnieje2 :: (a -> Bool) -> [a] -> Bool
istnieje2 f arr = any f arr




-- Sprawdzenie, czy wszystkie liczby w liście są parzyste
test1 = dlaKazdego even [2, 4, 6]        -- Oczekiwany wynik: True
test2 = dlaKazdego even [2, 4, 5, 6]     -- Oczekiwany wynik: False

-- Sprawdzenie, czy wszystkie liczby w liście są większe od zera
test3 = dlaKazdego (> 0) [1, 2, 3]       -- Oczekiwany wynik: True
test4 = dlaKazdego (> 0) [1, -2, 3]      -- Oczekiwany wynik: False

-- Sprawdzenie dla pustej listy (zawsze zwraca True, ponieważ nie ma elementów, które naruszałyby warunek)
test5 = dlaKazdego even []               -- Oczekiwany wynik: True

-- Testy dla istnieje

-- Sprawdzenie, czy przynajmniej jedna liczba w liście jest parzysta
test6 = istnieje even [1, 3, 5, 6]       -- Oczekiwany wynik: True
test7 = istnieje even [1, 3, 5]          -- Oczekiwany wynik: False

-- Sprawdzenie, czy przynajmniej jedna liczba w liście jest większa od zera
test8 = istnieje (> 0) [-1, -2, 3]       -- Oczekiwany wynik: True
test9 = istnieje (> 0) [-1, -2, -3]      -- Oczekiwany wynik: False

-- Sprawdzenie dla pustej listy (zawsze zwraca False, ponieważ nie ma elementów, które spełniają warunek)
test10 = istnieje even []                -- Oczekiwany wynik: False

-- Uruchomienie testów
main :: IO ()
main = do
  print test1
  print test2
  print test3
  print test4
  print test5
  print test6
  print test7
  print test8
  print test9
  print test10

