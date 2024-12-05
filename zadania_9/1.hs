

--read :: Read a => String -> a

silnia :: Int -> Int
silnia 1 = 1
silnia n = n * silnia (n-1)

main = do
    putStrLn "Podaj silnie: "
    silnia_string <- getLine
    let silnia_int = read silnia_string 
    putStrLn $ "Twoja silnia to " ++ show (silnia silnia_int) 