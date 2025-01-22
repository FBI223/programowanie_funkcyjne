lpierwsze :: [Int]
lpierwsze = [1,2..]


nmcp :: Int -> Int
--nmcp n = minimum $ filter (\x -> mod n x == 0) lpierwsze
--nmcp n = minimum $ filter (\x -> mod n x == 0)  lpierwsze
--nmcp n = minimum $ filter (isZero . mod n)  lpierwsze
--nmcp n = minimum $ filter (isZero . mod n)  lpierwsze
--nmcp n = minimum $ flip  filter   lpierwsze (isZero . mod n)
nmcp  = minimum . flip  filter   lpierwsze . (isZero . ) . mod 
--nmcp = minimum . flip filter lpierwsze . (isZero .) . mod



isZero :: Int -> Bool
isZero 0 = True
isZero _ = False
