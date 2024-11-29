type Point = (Double, Double)

-- Funkcja główna: Znajduje parę punktów o minimalnej odległości
minDist :: [Point] -> (Point, Point, Double)
minDist lista_pkt = wybierzMinimum lista_odleglosci ((0, 0), (0, 0), infinity)
  where 
    lista_odleglosci = liczOdleglosci (dwojki lista_pkt)
    infinity = 1 / 0 -- reprezentacja "nieskończoności" w Haskellu

-- Wybiera minimum z listy (rekurencyjnie)
wybierzMinimum :: [(Point, Point, Double)] -> (Point, Point, Double) -> (Point, Point, Double)
wybierzMinimum [] accu = accu
wybierzMinimum ((a, b, odl):rest) (a_accu, b_accu, odl_accu) =
    wybierzMinimum rest accu_new
  where 
    accu_new 
        | odl < odl_accu = (a, b, odl)
        | otherwise = (a_accu, b_accu, odl_accu)

-- Liczy odległości dla wszystkich par punktów
liczOdleglosci :: [(Point, Point)] -> [(Point, Point, Double)]
liczOdleglosci [] = []
liczOdleglosci (head_krotka:rest) = odleglosc head_krotka : liczOdleglosci rest

-- Liczy odległość między dwoma punktami
odleglosc :: (Point, Point) -> (Point, Point, Double)
odleglosc ((x1, y1), (x2, y2)) = ((x1, y1), (x2, y2), odl)
  where 
    odl = sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

-- Generuje wszystkie pary punktów
dwojki :: [a] -> [(a, a)]
dwojki [] = []
dwojki (x:xs) = [(x, y) | y <- xs] ++ dwojki xs







trojki ::Eq a => [a] -> [(a, a, a)]
trojki [] = []
trojki (x:xs) = [(x, y, z) | y <- xs, z <- dropWhile (/= y) xs, z /= y] ++ trojki xs


bezElementu :: Eq a => a -> [a] -> [a]
bezElementu _ [] = []
bezElementu e (x:xs)
    | x == e    = bezElementu e xs -- Pomijamy element
    | otherwise = x : bezElementu e xs
