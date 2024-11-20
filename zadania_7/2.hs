data Calkowite = Zero | Nastepnik Calkowite | Poprzednik Calkowite deriving (Show,Eq)

calkowiteToInt :: Calkowite -> Integer
calkowiteToInt Zero = 0
calkowiteToInt (Nastepnik x) = (calkowiteToInt x) + 1
calkowiteToInt (Poprzednik x) = (calkowiteToInt x) - 1

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