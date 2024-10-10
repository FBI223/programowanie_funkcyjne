-- zad 1 


Term: λab.abab
λa. (λb. ab ab)
λa zwraca funkcje (λb. ab ab)
λb zwraca funkcje gdzie w ciele funkcji jest wyrazenie :  ab ab 
λa.(λb.((ab)(ab)))

aplikujemy funkcje a do argumentu b az 2 razy "a(b)" , potem aplikujemy funkcje : ab(ab) 


-- chyba Curryfikacja ???
-- Curryfikacja to proces przekształcania funkcji, 
-- która teoretycznie przyjmuje wiele argumentów, na ciąg funkcji, które przyjmują po jednym argumencie
