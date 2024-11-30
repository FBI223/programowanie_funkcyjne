
data Mb a = Mb { poczatek :: [a],
                  koniec :: [a]  }


dnp :: Mb a -> a -> Mb a
dnp (Mb poczatek koniec ) element = (Mb ( element : poczatek) koniec )

dnk :: Mb a -> a -> Mb a
dnk (Mb poczatek koniec ) element = (Mb poczatek ( element : koniec) )

ull :: Mb a -> Mb a
ull (Mb poczatek koniec ) = (Mb [] koniec ) 

upl :: Mb a -> Mb a
upl (Mb poczatek koniec ) = (Mb poczatek [] ) 

mb2list :: Mb a -> [a]
mb2list (Mb poczatek koniec ) = reverse poczatek ++ koniec
