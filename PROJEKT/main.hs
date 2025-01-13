import System.IO
import System.Environment

-- :set args "C:\\Users\\msztu\\Documents\\haskell_projects\\PF\\programowanie_funkcyjne\\PROJEKT\\mystery"

-- Funkcja główna programu

--splitEquation "kot + kto = tok"
--splitEquation "Send + More = MONEY"
--splitEquation "rEBuS * i = SUDOKU"


-- "KTO + KOT = TOK"
-- "TRZY + TRZY = SZESC"
-- "GRAD + DESZCZ = STRATA"
-- "KOGUT + KURA = JAJKO"
-- "LUK + LUK = KOLO"
-- "CHMURA + CHMURA = DESZCZ"
-- "KIOTO + OSAKA = TOKIO"
-- "REBUS * I = SUDOKU"
-- "WILK + UNIKA = LUDZI"
--
-- "USA + USSR = PEACE"
-- "Send + More = MONEY"
--
-- "ZERO + ZERO = JEDEN"
-- "POL + POL = CALA"
-- "ROZUM - DUZO = MOZE"
-- "TEST + JEST = SUPER"
-- "DOM * DOM = MIASTO"
-- "KWARTA + KWARTA = POLOWA"
-- "BLAD + BLAD = GAUSS"
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""
-- "BUM + BUM + BUM = DUD"
-- "OLD + OLD + OLD = GOOD"
-- "BYE + BYE + BYE + BYE + BYE + BYE = RAY"
-- "TED + HAS + GOOD = TASTE"
-- "LYNNE + LOOKS = SLEEPY"
-- "NOTICE + NICE = PRICES"
-- "LEAH + LOVES = RUSSIA"
-- ""
-- ""
-- ""
-- ""
-- ""
-- ""






changeSentenceIntoEquation :: [String] -> [ (Char, Char) ] -> [String]
changeSentenceIntoEquation [] _ = [] 
changeSentenceIntoEquation (x:xs) slownik = changeWordIntoNumber x slownik : changeSentenceIntoEquation xs slownik


changeWordIntoNumber :: String -> [ (Char, Char) ] -> String
changeWordIntoNumber [] _ = [] 
changeWordIntoNumber (x:xs) slownik = changeLetterIntoDigit x slownik : changeWordIntoNumber xs slownik

changeLetterIntoDigit :: Char ->  [ (Char, Char) ] -> Char
changeLetterIntoDigit c slownik = snd $ head $ filter (\(a,b) -> a == c) slownik
  where
    przypisanie = filter (\(a,b) -> a == c) slownik


allPossibilities :: String -> [[ (Char, Char) ]]
allPossibilities linia = zipWithEach unikalneLitery permutacjeLiczb
  where
    unikalneLitery = uniqueCharacters linia
    ileLiter = length unikalneLitery

    permutacjeLiczb 
              |   ileLiter < 10   = knPermutations "0123456789" ileLiter
              |        otherwise  = permutations  "0123456789"


permutations :: (Eq a) => [a] -> [[a]]
permutations [] = [[]]  -- Base case: a single empty permutation for an empty list
permutations zbior = [x : ys | x <- zbior, ys <- permutations (filter (/= x) zbior)]

-- [x : ys | x <- zbior, x /= '0' || null ys, ys <- knPermutations (filter (/= x) zbior) (k - 1)]


--knPermutations :: (Eq a) => [a] -> Int -> [[a]]
--knPermutations [] _ = []
--knPermutations _ 0 = [[]]
--knPermutations zbior k = [x : ys | x <- zbior, ys <- knPermutations (filter (/= x) zbior) (k - 1)]


knPermutations :: [Char] -> Int -> [[Char]]
knPermutations [] _ = []
knPermutations _ 0 = [[]]
knPermutations zbior k = 
    [x : ys | x <- zbior, ys <- knPermutations (filter (/= x) zbior) (k - 1), x /= '0' || null ys]




zipWithEach :: [b] -> [[a]] -> [[ (b, a) ]]
zipWithEach bs listOfLists = map (zip bs) listOfLists


uniqueCharacters :: String -> [Char]
uniqueCharacters [] = []
uniqueCharacters (x:xs)
    | toUpper x >= 'A' && toUpper x <= 'Z'     = toUpper x : uniqueCharacters (filter (\char -> toUpper char /= toUpper x) xs)
    | otherwise                                = uniqueCharacters xs

splitEquation :: String -> [String]
splitEquation equation = words $ map (\char -> toUpper char ) equation


toUpper :: Char -> Char
toUpper c
  | c >= 'a' && c <= 'z' = toEnum (fromEnum c - 32)
  | c >= 'A' && c <= 'Z' = c
  | otherwise = ' '

