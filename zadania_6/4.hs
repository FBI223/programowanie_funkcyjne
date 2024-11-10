

-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

-- doDziesietnego 2 [1,0,1,1]
-- doDziesietnego 16 [15,15] 


doDziesietnego :: Int -> [Int] -> Int
doDziesietnego base arr = foldr (+) 0 (zipWith (\x y -> x * (base ^ y)) arr positions )
    where positions = reverse [0 .. length arr - 1]

-- x to nasz np B albo 4 na jakiejs pozycji 
-- y to nasza pozycja tego B albo 4 w liczbie 
-- zmieniamy dana iterke na pozycji na interpretacje dziesiatne
-- dostajemy reprezentacje dziesietna i potem sumujemy tylko 