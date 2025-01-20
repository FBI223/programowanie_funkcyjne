

liczbaEulera :: Int -> Double
--liczbaEulera n = foldl (+) 0.0  ( map (\x -> jedynka/(fromIntegral (foldl (*) 1 ( flip take [1..] n )))  ) (flip take [1..] n ) )
--liczbaEulera = foldl (+) 0.0  ( map (\x -> jedynka/ (fromIntegral  factorial x)  ) . (flip take [1..]  ) )
liczbaEulera = foldl (+) 0.0  ( map (\x -> (1 /) . fromIntegral .  factorial x ) . (flip take [1..]  ) )


-- point free io 
-- liczbaEulera = foldl (+) 0.0 . ap (map . const . (jedynka /) . fromIntegral . foldl (*) 1 . flip take [1..]) (flip take [1..])


jedynka :: Int
jedynka = 1

factorial :: Int -> Int
--factorial n = foldl (*) 1 ( take n [1..] )
--factorial n = foldl (*) 1 ( flip take [1..] n )
factorial  = (foldl (*) 1) . (flip take [1..] )