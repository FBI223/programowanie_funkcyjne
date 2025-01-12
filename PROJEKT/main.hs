import System.IO
import System.Environment

-- :set args "C:\\Users\\msztu\\Documents\\haskell_projects\\PF\\programowanie_funkcyjne\\PROJEKT\\mystery"

-- Funkcja główna programu


splitEquation :: String -> [String]
splitEquation equation = words $ map (\char -> filterEquation char ) equation


filterEquation :: Char -> Char
filterEquation c
  | c >= 'a' && c <= 'z' = toEnum (fromEnum c - 32)
  | c >= 'A' && c <= 'Z' = c
  | otherwise = ' '



