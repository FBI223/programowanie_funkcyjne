

displayString :: Int->String->IO ()
displayString 0 _ = return ()
displayString n str = do
        putStrLn str
        displayString (n-1) str
main = displayString 5 "ala ma kota"



{-
main = do
    return "nic"
    return ()
    return (5+6)
    napis<-return "Hello, world!"
    putStrLn napis
    return "SLYCHAC MNIE?"
-}

