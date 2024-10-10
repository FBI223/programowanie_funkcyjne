ocena :: Double -> String
ocena x
    | x == 2.0  = "niezaliczone"  -- Warunek dla oceny 2.0
    | x == 3.0  = "zaliczone na 3"  -- Warunek dla oceny 2.0
    | x == 4.0  = "zaliczone na 4"  -- Warunek dla oceny 2.0
    | x == 5.0  = "zaliczone na 5 brawo!"        -- Warunek dla oceny 5.0
    | otherwise = "masz wpisana zla ocene!! " ++ show x  -- Inny przypadek (jeśli powyższe nie są spełnione)

