data Calkowite = Zero | Nastepnik Calkowite | Poprzednik Calkowite deriving (Show,Eq)

calkowiteToInt :: Calkowite -> Integer
calkowiteToInt Zero = 0
calkowiteToInt (Nastepnik x) = (calkowiteToInt x) + 1
calkowiteToInt (Poprzednik x) = (calkowiteToInt x) - 1


 
intToCal :: Integer -> Calkowite
intToCal x | x == 0 = Zero
           | x < 0 = Poprzednik (intToCal (x + 1))
           | x > 0 = Nastepnik (intToCal (x - 1))





zero :: Calkowite
zero = Zero

jeden :: Calkowite
jeden = Nastepnik Zero

minusJeden :: Calkowite
minusJeden = Poprzednik Zero

dwa :: Calkowite
dwa = Nastepnik (Nastepnik Zero)

minusDwa :: Calkowite
minusDwa = Poprzednik (Poprzednik Zero)

--calkowiteToInt minusDwa  
--calkowiteToInt dwa  
--calkowiteToInt zero  