
--putStrLn (show m3)
--putStrLn (show m4)

m1 = Matrix22 1 2 3 4  
m2 = Matrix22 5 6 7 8 

m3 = m1 + m2
m4 = m1 * m2     


data Matrix22 = Matrix22 {
    a :: Int,
    b :: Int,
    c :: Int,
    d :: Int
}  

instance Eq Matrix22 where
    (Matrix22 a1 b1 c1 d1 ) == (Matrix22 a2 b2 c2 d2) = (a1 == a2) && (b1 == b2) && ( c1 == c2 ) && ( d1 == d2 )

instance Show Matrix22 where
    show (Matrix22 a b c d) = show a ++ " " ++ show b ++ "\n" ++show c ++ " " ++ show d

instance Num Matrix22 where
    (Matrix22 a1 b1 c1 d1) + (Matrix22 a2 b2 c2 d2) = Matrix22 (a1 + a2) (b1 + b2) ( c1 + c2 ) ( d1 + d2 )
    (Matrix22 a1 b1 c1 d1) * (Matrix22 a2 b2 c2 d2) =
        Matrix22 (a1 * a2 + b1 * c2) (a1 * b2 + b1 * d2) 
                 (c1 * a2 + d1 * c2) (c1 * b2 + d1 * d2)


instance Ord Matrix22 where
    compare (Matrix22 a1 b1 c1 d1) (Matrix22 a2 b2 c2 d2) =
        compare (a1 + b1 + c1 + d1) (a2 + b2 + c2 + d2)


instance Enum Matrix22 where
    succ (Matrix22 a b c d) = Matrix22 (a + 1) (b + 1) (c + 1) (d + 1)
    pred (Matrix22 a b c d) = Matrix22 (a - 1) (b - 1) (c - 1) (d - 1)
    toEnum x = Matrix22 x x x x
    fromEnum (Matrix22 a b c d) = a + b + c + d

