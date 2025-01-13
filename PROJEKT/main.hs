import System.IO
import System.Environment; -- dla funkcji getArgs

-- :set args "C:\\Users\\msztu\\Documents\\haskell_projects\\PF\\programowanie_funkcyjne\\PROJEKT\\mystery"


main :: IO ()
main = do

    contents <- readFile "in"
    
    let linie = lines contents
    
    let wyniki = map cryptharithmsSolver linie
    
    writeFile "out" (unlines (map show wyniki))
    
    mapM_ (putStrLn . show) wyniki




zipWithEach :: [b] -> [[a]] -> [[ (b, a) ]]
zipWithEach bs listOfLists = map (zip bs) listOfLists


allPossibilities :: String -> [[ (Char, Char) ]]
allPossibilities linia = wszystkie_mozliwosci_przypisan
  where
    unikalneLitery = uniqueCharacters linia

    ileLiter = length unikalneLitery

    permutacjeLiczb 
              |   ileLiter < 10   = knPermutations "0123456789" ileLiter
              |        otherwise  = permutations   "0123456789"
    
    wszystkie_mozliwosci_przypisan = zipWithEach unikalneLitery permutacjeLiczb


cryptharithmsSolver :: String -> [Int]
cryptharithmsSolver linia = wynik
  where
    wszystkie_dopasowania = allPossibilities linia
    rozbite_zdanie = splitEquation linia 
    operacja 
        | elem '*' linia = mult
        | elem '-' linia = sub
        | elem '+' linia = add
        |otherwise = add
  
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
convertEquation strs
  | all isValidStringNumber strs = map stringToInt strs
  | otherwise              = []



isValidStringNumber :: String -> Bool
isValidStringNumber num
    | null num           = False
    | length num == 1    = True  
    | head num == '0'    = False 
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