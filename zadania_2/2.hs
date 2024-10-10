
-- grupa num , mozna przeprowadzac na tym rodzaju zmiennych operacje arytmetyczne
-- grupa ord , mozna porownywac wartosci
-- grupa show, mozna konwertowac do string te typy (a)
co_wieksze :: (Num a, Ord a, Show a) => a -> a -> String
co_wieksze x y 
    | iloczyn > suma = "iloczyn " ++ show x ++ " oraz " ++ show y ++ " jest wiekszy od sumy."
    | otherwise = "Iloczyn nie jest wiekszy od sumy"
    where -- deklaracja tymczasowych zmiennych
        iloczyn = x * y
        suma = x + y
