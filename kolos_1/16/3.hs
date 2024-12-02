data Klos a = Klos {
    poczatek :: [a],
    koniec :: [a]
}

wnpk :: Klos a -> a -> Klos a
wnpk ( Klos poczatek koniec ) dodawany = Klos ( dodawany : poczatek ) koniec

wnkk :: Klos a -> a -> Klos a
wnkk ( Klos poczatek koniec ) dodawany = Klos  poczatek  ( dodawany : koniec )

k2list :: Klos a -> [a]
k2list ( Klos poczatek koniec ) = poczatek ++ ( reverse koniec )

