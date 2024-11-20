data GaussNumber = GaussNumber {
    x :: Int ,
    y :: Int
}  

instance Eq GaussNumber where
    (GaussNumber x1 y1) == (GaussNumber x2 y2) = (x1 == x2) && (y1 == y2)
    (GaussNumber x1 y1) /= (GaussNumber x2 y2) = ( x1 /= x2) || (y1 /= y2)

instance Show GaussNumber where
    show (GaussNumber x y)
        | y <  0 = show x ++ " - " ++ show (abs y) ++ "i"
        | y >= 0 = show x ++ " + " ++ show y ++ "i"

instance Num GaussNumber where
    (GaussNumber a b) + (GaussNumber c d) = GaussNumber (a + c) (b + d)
    (GaussNumber a b) - (GaussNumber c d) = GaussNumber (a - c) (b - d)
    (GaussNumber a b) * (GaussNumber c d) = GaussNumber (a * c - b * d) (a * d + b * c)
    negate (GaussNumber a b) = GaussNumber (-a) (-b)
    abs gaus = gaus
    --abs (GaussNumber a b) = GaussNumber (sqrt' (a * a + b * b)) ( 0 )
    signum gaus = GaussNumber 1 0
    fromInteger n = GaussNumber (fromInteger n) 0
    

g11 :: GaussNumber
g11 = GaussNumber 3 (-4)  

g22 :: GaussNumber
g22 = GaussNumber 3 4  




g1 :: GaussNumber
g1 = GaussNumber 3 4  

g2 :: GaussNumber
g2 = GaussNumber 1 (-2)  

gZero :: GaussNumber
gZero = GaussNumber 0 0  


gAdd :: GaussNumber
gAdd = g1 + g2  


gSub :: GaussNumber
gSub = g1 - g2  

gMul :: GaussNumber
gMul = g1 * g2 


gNeg :: GaussNumber
gNeg = negate g1  


gAbs :: GaussNumber
gAbs = abs g1  


gSignum :: GaussNumber
gSignum = signum g1  


gFromInt :: GaussNumber
gFromInt = fromInteger 7 
