data Wr a = Wr {
    stos_list :: [[a]] ,
    count_list :: Integer,
    ostatnia_de :: Bool  }


dg :: Wr a -> [a] -> Wr a
dg (Wr lista n _ ) podlista = Wr (podlista : lista) (n+1) False


ug :: Wr a -> Wr a
ug (Wr lista 0 _ ) = (Wr lista 0 ) False
ug (Wr lista n _ ) = Wr (tail lista) (n-1) False



de :: Wr a -> a -> Wr a
de (Wr lista 0 _ ) element = (Wr ( [[element]]) 1 ) True
de (Wr (head_list : rest) n _ ) element = Wr lista_list_wynikowa n True
    where
        zmodyfikowana_lista = element : head_list 
        lista_list_wynikowa = zmodyfikowana_lista : rest


ue :: Wr a -> Wr a
ue (Wr lista 0 _) = Wr lista 0 False
ue (Wr (head_list : rest_empty) 1 True)
  | null (tail head_list) = Wr [[]] 0 False
  | otherwise             = Wr [tail head_list] 1 True
ue (Wr (head_list : rest) n True)
  | null (tail head_list) = Wr rest (n - 1) False
  | otherwise             = Wr (tail head_list : rest) n True
ue (Wr lista n False) = Wr lista n False



lg :: Wr a -> Integer
lg (Wr lista n _ ) = n

wr2l :: Wr a -> [a]
wr2l (Wr lista 0 _ ) = []
wr2l (Wr lista n _ ) = concat ( reverse ( map (\podlista -> reverse podlista ) lista  ) )
