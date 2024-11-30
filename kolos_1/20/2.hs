

bp :: Int -> [String]
bp 0 = []
bp n = [ str | str <- all_strings , czy_palindrom str == True && czy_taka_sama_liczba_A_B str 'a' 'b' == True ]
    where
        all_strings = allStrings 'a' 'b' n


allStrings :: Char -> Char -> Int -> [String]
allStrings _ _ 0 = [""]  -- Dla długości 0 zwracamy listę z pustym ciągiem
allStrings a b n = [x : xs | x <- [a, b], xs <- allStrings a b (n - 1)]


czy_palindrom :: String -> Bool
czy_palindrom [] = False
czy_palindrom s_in = s_in == ( reverse s_in ) 

czy_taka_sama_liczba_A_B :: String -> Char -> Char -> Bool
czy_taka_sama_liczba_A_B [] _ _ = True
czy_taka_sama_liczba_A_B napis a b = liczba_a == liczba_b
    where
        liczba_a = countChar a napis
        liczba_b = countChar b napis

countChar :: Char -> String -> Int
countChar _ [] = 0  -- Jeśli ciąg jest pusty, liczba wystąpień to 0
countChar c (x:xs)
    | c == x    = 1 + countChar c xs  -- Jeśli znak `x` jest równy `c`, dodaj 1
    | otherwise = countChar c xs      -- W przeciwnym razie przejdź do reszty ciągu





{-


bp :: Int -> [String]
bp 0 = []
bp n
  | odd n     = []  -- Palindromy zbalansowane muszą mieć parzystą długość
  | otherwise = generateBalancedPalindromes (n `div` 2) (n `div` 2)

-- Generuje zbalansowane palindromy
generateBalancedPalindromes :: Int -> Int -> [String]
generateBalancedPalindromes 0 0 = [""]
generateBalancedPalindromes a b
  | a < 0 || b < 0 = []
  | otherwise = [ 'a' : p ++ "a" | p <- generateBalancedPalindromes (a - 1) b ]
             ++ [ 'b' : p ++ "b" | p <- generateBalancedPalindromes a (b - 1) ]

-}

