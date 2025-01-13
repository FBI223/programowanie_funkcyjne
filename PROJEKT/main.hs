import System.IO

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


--  "TED + HAS + GOOD = TASTE"
--   134   605   9774   10513
-- [('T','1'),('E','3'),('D','4'),('H','6'),('A','0'),('S','5'),('G','9'),('O','7')]

--cryptharithmRecursive [[('A','1'),('B','2')],[('A','3'),('B','4')]] ["ABAB","AA" , "BB"]



----------------------------------------------------------
solveCryptharithm :: String -> (Int -> Int -> Int) -> [String] -> Maybe [(Char, Char)]
solveCryptharithm linia operacja zdanie = go unikalneLitery "0123456789" []
  where
    -- Wyciągnięcie unikalnych liter
    unikalneLitery = uniqueCharacters linia

    -- Funkcja rekurencyjna do generowania kombinacji i sprawdzania
    go :: [Char] -> [Char] -> [(Char, Char)] -> Maybe [(Char, Char)]
    go [] _ przypisanie = if isValid przypisanie then Just przypisanie else Nothing
    go (litera:resztaLiter) cyfry przypisanie =
        case cyfry of
            [] -> Nothing
            _  -> foldr (\cyfra acc ->
                            case acc of
                                Just _ -> acc  -- Jeśli znaleziono rozwiązanie, zakończ rekursję
                                Nothing ->
                                    let nowePrzypisanie = przypisanie ++ [(litera, cyfra)]
                                    in go resztaLiter (filter (/= cyfra) cyfry) nowePrzypisanie
                        ) Nothing cyfry

    -- Funkcja sprawdzająca warunki dla danego przypisania
    isValid :: [(Char, Char)] -> Bool
    isValid przypisanie =
        let equation = convertEquation (changeSentenceIntoEquation zdanie przypisanie)
        in checkEquation equation operacja


main :: IO ()
main = do
    let zdanie = "TED + HAS + GOOD = TASTE"
    let operacja = add
    let wynik = solveCryptharithm zdanie operacja (splitEquation zdanie)
    print wynik

-----------------------------------------------------------------------------


zipWithEach :: [b] -> [[a]] -> [[ (b, a) ]]
zipWithEach bs listOfLists = map (zip bs) listOfLists


allPossibilities :: String -> [[ (Char, Char) ]]
allPossibilities linia = wszystkie_mozliwosci_przypisan
  where
    unikalneLitery = uniqueCharacters linia

    ileLiter = length unikalneLitery

    permutacjeLiczb 
              |   ileLiter < 10   = knPermutations "0123456789" ileLiter
              |        otherwise  = permutations  "0123456789"
    
    wszystkie_mozliwosci_przypisan = zipWithEach unikalneLitery permutacjeLiczb


cryptharithmsSolver :: String -> [Int]
cryptharithmsSolver linia = wynik
  where
    wszystkie_dopasowania = allPossibilities linia
    rozbite_zdanie = splitEquation linia 
    operacja 
        | elem '*' linia = mult
        | elem '/' linia = sub
        | otherwise = add
  
    wynik =  cryptharithmRecursive wszystkie_dopasowania operacja rozbite_zdanie




cryptharithmRecursive :: [[ (Char, Char) ]] -> (Int -> Int -> Int) -> [String] -> [Int]
cryptharithmRecursive [] _ _ = []
cryptharithmRecursive _ _ [] = []
cryptharithmRecursive (mini_slownik : reszta_slownika) operacja zdanie
                    | checkEquation equation operacja  =  equation
                    | otherwise               =  cryptharithmRecursive reszta_slownika operacja zdanie
  where
    equation = convertEquation $ changeSentenceIntoEquation zdanie mini_slownik



checkEquation :: [Int] -> (Int -> Int -> Int) -> Bool
checkEquation [] _ = False
checkEquation [_] _ = False
checkEquation xs op = foldl op (head initList) (tail initList) == last xs
  where
    initList = init xs 



convertEquation :: [String] -> [Int]
convertEquation [] = []
convertEquation (x:xs)
    | isValidNumber x = stringToInt x : convertEquation xs
    | otherwise       = []  -- Niepoprawne liczby odrzucamy
  where
    isValidNumber num
        | null num           = False
        | length num == 1    = True  -- Pojedynczy znak jest poprawny
        | head num == '0'    = False -- Wiodące zero w liczbie
        | otherwise          = True


add :: Int -> Int -> Int
add x y = x + y

sub :: Int -> Int -> Int
sub x y = x - y

mult :: Int -> Int -> Int
mult x y = x * y


stringToInt :: String -> Int
stringToInt [] = 0
stringToInt str
    | all isDigit str = foldl (\acc x -> acc * 10 + charToDigit x) 0 str
    | otherwise = 0
  where
    isDigit c = c >= '0' && c <= '9'
    charToDigit c = fromEnum c - fromEnum '0'

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


permutations :: [Char] -> [[Char]]
permutations [] = [[]] 
permutations zbior = [x : ys | x <- zbior, ys <- permutations (filter (/= x) zbior)]



knPermutations :: [Char] -> Int -> [[Char]]
knPermutations [] _ = []
knPermutations _ 0 = [[]]
knPermutations zbior k = [x : ys | x <- zbior, ys <- knPermutations (filter (/= x) zbior) (k - 1)]




-- [x : ys | x <- zbior, x /= '0' || null ys, ys <- knPermutations (filter (/= x) zbior) (k - 1)]

--knPermutations :: (Eq a) => [a] -> Int -> [[a]]
--knPermutations [] _ = []
--knPermutations _ 0 = [[]]
--knPermutations zbior k = [x : ys | x <- zbior, ys <- knPermutations (filter (/= x) zbior) (k - 1)]







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

