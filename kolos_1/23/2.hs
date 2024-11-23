wyniki :: Double -> [(String,Double)] -> [(String,String)]
wyniki tops_score [] = []
wyniki tops_score ((a,b) : xd) = ( c,d) : wyniki tops_score xd
    where 
        c = trim a
        d
            | ((b / tops_score) * 100 ) > 90 && ((b / tops_score) * 100 ) <= 100  = "5.0"
            | ((b / tops_score) * 100 ) > 80 && ((b / tops_score) * 100 ) <= 90 = "4.5"
            | ((b / tops_score) * 100 ) > 70 && ((b / tops_score) * 100 ) <= 80 = "4.0"
            | ((b / tops_score) * 100 ) > 60 && ((b / tops_score) * 100 ) <= 70 = "3.5"
            | ((b / tops_score) * 100 ) > 50 && ((b / tops_score) * 100 ) <= 60 = "3.0"
            | ((b / tops_score) * 100 ) <= 50 && ((b / tops_score) * 100 ) >= 0 = "2.0"
            | otherwise = "Nieprawidlowe dane"



trim :: String -> String
trim xd = reverse  ( dropWhile (== ' ') ( reverse  (dropWhile (== ' ') xd) ) )

