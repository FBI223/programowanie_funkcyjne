usun :: String -> String -> String
usun str toRemove = foldr (\char acc -> if char `elem` toRemove then acc else char : acc) "" str

-- Test cases
main :: IO ()
main = do
    putStrLn $ usun "Ala ma kota" "kra" -- Expected: "Al m ot"
    putStrLn $ usun "Haskell" "aeiou" -- Expected: "Hskll"
    putStrLn $ usun "Functional Programming" "abcde" -- Expected: "Funtionl Progrmming"
    putStrLn $ usun "1234567890" "13579" -- Expected: "24680
