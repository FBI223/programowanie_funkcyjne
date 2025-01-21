-- Funkcja obliczająca rozkład częstotliwości znaków w wierszu
frequency :: String -> [(Char, Int)]
frequency [] = []
frequency (x:xs) = let count = length (filter (==x) xs) + 1
                       rest = filter (/=x) xs
                   in (x, count) : frequency rest


main :: IO ()
main = do
    putStrLn "Podaj wiersz tekstu (lub '.' aby zakończyć):"
    input <- getLine
    if input == "." 
        then return ()
        else do
            let freq = frequency input
            putStrLn "Rozkład częstotliwości znaków:"
            print freq
            main
