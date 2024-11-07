


kuick_sort :: (Ord a) => [a] -> [a]
kuick_sort [] = []
kuick_sort (x:xs) = kuick_sort less ++ [x] ++ kuick_sort eq_greater
  where
    less = takeWhile (< x) xs
    eq_greater = dropWhile (< x) xs








quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = (quicksort less) ++ [x] ++ (quicksort greater)
    where
        less = filter (< x) xs
        greater = filter (>= x) xs


