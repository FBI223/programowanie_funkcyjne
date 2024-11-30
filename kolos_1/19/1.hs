
-- Definicja ciągu a_n
ciag_a :: Int -> Int
ciag_a 0 = 1
ciag_a n = (n - 1) * ciag_b (n - 1) - 3 * ciag_a (n - 1)

-- Definicja ciągu b_n
ciag_b :: Int -> Int
ciag_b 0 = 1
ciag_b n = 3 * ciag_b (n - 1) + (n - 1) ^ 2 * ciag_a (n - 1) - (n - 1) ^ 2



seqIndex :: Int -> Int
seqIndex m = length ( takeWhile ( < m ) lista_sum )
  where
    -- Generowanie ciągu a_n
    lista_ciag_a = [ciag_a n | n <- [0..]]
    lista_sum    = [ sumujNwyrazow n lista_ciag_a | n <- [1..]  ]   



sumujNwyrazow :: Int -> [Int] -> Int
sumujNwyrazow 0 lista = 0
sumujNwyrazow _ [] = 0
sumujNwyrazow n (head:xs) = head  + sumujNwyrazow (n - 1) xs
