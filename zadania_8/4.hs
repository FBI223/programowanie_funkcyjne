
--d :: [Double] -> Double -> [Double]
--d list x = map (\y->y/x) list
--d list x = flip map list (\y->y/x) 
--d list x = flip map list (\y->(/) y x) 
--d list x = flip map list (\y-> flip (/) x y) 
--d list x = flip map list ( flip (/) x ) 
--d list x = flip map list .( flip (/) )
--d list = (flip map list) . (flip (/))
--d list = (.) (flip map list) (flip (/))
--d list = flip (.) (flip (/)) (flip map list) 
d  = (flip (.) (flip (/))) . (flip map ) 


