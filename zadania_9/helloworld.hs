
--putStrLn :: String -> IO ()
--getLine :: IO String


przywitajSie :: String -> String
przywitajSie imie = "Czesc " ++ imie ++ ". Witam serdecznie!"


main = do
    putStrLn "Podaj swoje imie: "
    imie<-getLine
    putStrLn $ przywitajSie imie
    putStrLn $ "Twoje imie ma " ++ show (length imie) ++ " liter."