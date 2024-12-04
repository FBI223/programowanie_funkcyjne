
--m x list = map (\y->y*x) list
--m x = map (\y->y*x)
--m x  = map (\y-> (*) y x) 
--m x  = map (\y-> flip (*) x y) 
--m x  = map ( flip (*) x ) 
m  = map . flip (*)   


--m2 x = map (\y->y*x)
--m2 x = map . (*x)
m2 = map . (*)

