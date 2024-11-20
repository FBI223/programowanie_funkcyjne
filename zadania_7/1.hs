data Student = Student {
    imie :: String,
    nazwisko :: String,
    nrAlbumu :: Int
}

instance Show Student where
    show (Student imie nazwisko nrAlbumu) = imie ++ "\n" ++ nazwisko ++ "\n" ++ show nrAlbumu 

ja = Student "Marcin" "Najman" 4204201
-- ghci>  putStrLn (show ja)