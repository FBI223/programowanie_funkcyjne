--Marcin Sztukowski

import System.IO

main :: IO () 
main = do 
    contents <- readFile "in2" -- wczytywanie zawartosci pliku do zmiennej contents
    let linie = lines contents -- rozdziela caly tekst na liste wierszy ( odwrotnosc ulines )
    let wyniki = map cryptharithmsSolver linie -- przetwarzanie kazdej linii poprzez map
    let operatory_wyniki = map whichOperator linie -- operatory pokolei kazdego rownania 
    let resultsFormatted = zipWith formatting wyniki operatory_wyniki -- zipuje [ [1,2,3] , [4,5,6] ] wraz z [+ , *] itd i potem wykonuje   formatting [int] char -> string
    writeFile "out2" (unlines resultsFormatted) -- unlines bierze tablice i pomiedzy elementami wstawia \n miedzy tymi znakami i konwertuje na string 
    putStrLn (unlines resultsFormatted) 



-- formatujemy nasz wynik w postaci [int] na   x + y + z ... = wynik_rownania   
formatting :: [Int] -> Char -> String
formatting [] _ = "brak rozwiazania"
formatting [x] _ = " = " ++ show x
formatting [x,y] op = show x ++ " = " ++ show y --2 elementy
formatting (x:y:z:xs) op -- przynajmniej 3 elmenty
  | xs == []   = show x ++ " " ++ [op] ++ " " ++ show y ++ " = " ++ show z
  | otherwise = show x ++ " " ++ [op] ++ " " ++ show y ++ " " ++ [op] ++ " " ++ show z ++ " " ++ formatting xs op


-- ktorym operatorem sie poslugujemy w rownaniu
whichOperator :: String -> Char
whichOperator linia
  | elem '*' linia = '*'
  | elem '-' linia = '-'
  | elem '+' linia = '+'
  | otherwise = '+'


-- glowna funkcja
-- zakladamy ze tylko jeden typ operacji wystepuje w danym rownaniu
-- jesl istnieje rozwiazanie to cryptharithmRecursive zwroci pierwsze napotkane rozwiazanie a jak nie ma to zwroci []
cryptharithmsSolver :: String -> [Int]
cryptharithmsSolver linia = wynik
  where
    wszystkie_dopasowania = allPossibilities linia -- wszystkie mozliwe mini-slowniki dopasowan cyfr do liter
    rozbite_zdanie = splitEquation linia  -- rozbite zdanie na liste stringow
    operacja 
        | elem '*' linia = mult -- jesli jest znaczek * to znaczy ze mamy sprawdzic mnozenie 
        | elem '-' linia = sub  -- zakladamy ze tylko jeden typ operacji wystepuje w danym rownaniu
        | elem '+' linia = add
        |otherwise = add
  
    wynik =  cryptharithmRecursive wszystkie_dopasowania operacja rozbite_zdanie




-- dla kazdego zestawu/mozliwosci przypisan cyfr do liter oraz dla jednego zdania ( zestawu slow)
-- sprawdzamy czy nasze rownanie LEWA == PRAWA po konwersji na liczby
cryptharithmRecursive :: [[ (Char, Char) ]] -> (Int -> Int -> Int) -> [String] -> [Int]
cryptharithmRecursive [] _ _ = []
cryptharithmRecursive _ _ [] = []
cryptharithmRecursive (mini_slownik : reszta_slownika) operacja zdanie -- dla kazdego slownika
                    | checkEquation equation operacja  =  equation -- jesli sprawdzilismy nasze rownanie z operacja daje LEWA = PRAWA 
                    | otherwise               =  cryptharithmRecursive reszta_slownika operacja zdanie -- szukamy dalej z innym slownikiem przypisan cyfr do liter
  where
    equation = convertEquation $ changeSentenceIntoEquation zdanie mini_slownik
    -- zmieniamy liste slowa na liste liczb oraz konwertujemy ta liste na faktyczne Int



-- sprawdzamy czy nasze rownanie LEWA == PRAWA , dla podanej operacji arytmetycznej

checkEquation :: [Int] -> (Int -> Int -> Int) -> Bool
checkEquation []  _ = False
checkEquation [_] _ = False
checkEquation xs op = foldl1 op (init xs) == last xs


 -- kowertujemy wszystkie liczby w postaci string w equation na int
convertEquation :: [String] -> [Int]
convertEquation strs -- jesli wszystkie liczby nie maja 0 na poczatku albo maja jakiekolwiek cyfry
  | all isValidStringNumber strs = map stringToInt strs  --  to konwertujemy wszystkie liczby
  | otherwise              = [] -- gdy chociaz jedna liczba nie jest ok to pomijamy ten przypadek rownania


-- dokonujemy filtrakcji ktora liczba jest dozwolona w kryptarytmie np 
-- np dla slowa "ABC" niedozwolone sa np 012 
isValidStringNumber :: String -> Bool
isValidStringNumber num
    | null num           = False -- pusty string
    | length num == 1    = True  -- cyfra jest dozwolona
    | head num == '0'    = False -- jesli liczba zaczyna sie od zera to nie jest ok
    | otherwise          = True  -- inne przypadki jest ok 


-- dozwolone operacje arytmetyczne
add :: Int -> Int -> Int
add x y = x + y

sub :: Int -> Int -> Int
sub x y = x - y

mult :: Int -> Int -> Int
mult x y = x * y


-- konwersja z string na liczbe
stringToInt :: String -> Int
stringToInt [] = 0 -- baza rekurencji
stringToInt str = foldl (\acc x -> acc * 10 + charToDigit x) 0 str
  where -- jesli caly string sklada sie z cyfr to konwertujemy z uzyciem foldl i zwiekszaniem potegi 10 , 10^n
    charToDigit c = fromEnum c - fromEnum '0' -- prosta konwersja '9' na 9 (char na int)
-- fromEnum zwraca pozycje z enumeration type czyli dla fromEmum '0' zwroci 30


-- zmieniamy wszystkie slowa w zdaniu na liczby
changeSentenceIntoEquation :: [String] -> [ (Char, Char) ] -> [String]
changeSentenceIntoEquation [] _ = [] 
changeSentenceIntoEquation (x:xs) slownik = changeWordIntoNumber x slownik : changeSentenceIntoEquation xs slownik


-- zmieniamy nasze slowo w ciag cyfr czyli liczbe za pomoca slownika przypisan liter do cyfr
changeWordIntoNumber :: String -> [ (Char, Char) ] -> String
changeWordIntoNumber [] _ = [] 
changeWordIntoNumber (x:xs) slownik = changeLetterIntoDigit x slownik : changeWordIntoNumber xs slownik

-- dostajemy na wejsciu litere i zmieniamy ta litere wedlug naszego slownika przypisan cyfr do liter
changeLetterIntoDigit :: Char ->  [ (Char, Char) ] -> Char
changeLetterIntoDigit c slownik = snd $ head $ filter (\(a,b) -> a == c) slownik -- szukamy instrukcji przypisania dla naszej litery
                 -- head wyciagamy [(A,1)] a potem wyciagamy cyfre z krotki ( klucz wartosc ) = ( litera cyfra ) i zwracamy 


-- wczytuje linie z rownaniem i daje na wyjscie wszystkie mozliwe przypisania
-- przypisania cyfr do liter np jak mamy "A+B=C"
-- to dostajemy [ [(A,0),(B,1),(C,2)] ...  [(A,9),(B,8),(C,7)] ]
allPossibilities :: String -> [[ (Char, Char) ]]
allPossibilities linia = zipWithEach unikalneLitery permutacjeLiczb
  where
    unikalneLitery = uniqueCharacters linia -- np "ABC"
    ileLiter = length unikalneLitery
    permutacjeLiczb --np unikalne litery == "ABC" to permutacje [ "012" ... "789"]
              |   ileLiter < 10   = knPermutations "0123456789" ileLiter
              |        otherwise  = permutations   "0123456789"
    


-- zipuje unikalne litery [b] z wszystkimi permutacjami cyfr ( n liter oraz n cyfr)
-- tworzy to  wszystkie mozliwosci przypisan np [ [(A,1),(B,0)] ... [(A,9),(B,8)] ]
zipWithEach :: [b] -> [[a]] -> [[ (b, a) ]]
zipWithEach bs listOfLists = map (zip bs) listOfLists

-- permutacje calego zbioru
permutations :: [Char] -> [[Char]]
permutations [] = [[]] 
permutations zbior = [x : ys | x <- zbior, ys <- permutations (filter (/= x) zbior)]


-- permutacje czesci zbioru np wybieram permutacje k-elementow z n-zbioru
-- np 2-permutacja z 10-zbioru to [[0,1] .. [0,9] .. [9,8]] 
-- wyjdzie nam 10!/2! permutacji
knPermutations :: [Char] -> Int -> [[Char]]
knPermutations [] _ = []
knPermutations _ 0 = [[]]
knPermutations zbior k = [x : ys | x <- zbior, ys <- knPermutations (filter (/= x) zbior) (k - 1)]

-- szukamy jakie sa unikalne znaki alfabetu
-- np "AB ABA BABA C" da nam "ABC"
--
-- jesli znak przefiltrowany przez toUpper jest znakiem alfabetu to dolacz go do wyniku oraz przefiltruj 
-- oraz przefiltruj pozostaly string z danej litery i usun ja z tego stringa
-- idz dalej z rekurencja , jak napotkasz inny znak niz alfabetu to pomin
uniqueCharacters :: String -> [Char]
uniqueCharacters [] = []
uniqueCharacters (x:xs) -- iteracyjnie przechodzimy po kolejnych znakach 
    | toUpper x >= 'A' && toUpper x <= 'Z'     = toUpper x : uniqueCharacters (filter (\char -> toUpper char /= toUpper x) xs) 
    | otherwise                                = uniqueCharacters xs




-- dzieli wejsciowy string rownania na operandy oraz wynik
-- words rozbija nam string rozdzielony spacjami na tablice stringow bez bialych znakow pomiedzy slowami
-- mozemy tak zrobic bo kazdy inny znak niz alfabetu to zostanie przeksztalcony
-- przeksztalcony w spacje przez toUpper
splitEquation :: String -> [String]
splitEquation equation = words $ map (\char -> toUpper char ) equation


toUpper :: Char -> Char
toUpper c -- to enum przesuwa znak ASCII o 32 i potem konweruje na char spowrotem
  | c >= 'a' && c <= 'z' = toEnum (fromEnum c - 32) -- litery musza byc wielkie w algorytmie
  | c >= 'A' && c <= 'Z' = c -- zostawiamy jak jest 
  | otherwise = ' '  -- napotkalismy inny znak niz alfabet to pomijamy