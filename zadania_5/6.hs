


kuick_sort :: (Ord a) => [a] -> [a]
kuick_sort [] = []
kuick_sort (x:xs) = kuick_sort less ++ [x] ++ kuick_sort eq_greater
  where
    less = takeWhile (< x) xs
    eq_greater = dropWhile (< x) xs



quicksorts :: (Ord a) => [a] -> [a]
quicksorts [] = []
quicksorts xs = quicksorts less ++ [pivot] ++ quicksorts greater
    where
        mid = length xs `div` 2
        pivot = xs !! mid
        rest = take mid xs ++ drop (mid + 1) xs
        less = filter (< pivot) rest
        greater = filter (>= pivot) rest




quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = (quicksort less) ++ [x] ++ (quicksort greater)
    where
        less = filter (< x) xs
        greater = filter (>= x) xs


