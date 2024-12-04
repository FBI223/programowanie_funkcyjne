
--f list = filter (\x->x>5)) list
--g list = map (\x->x/5) list


--f list = filter (\x->x>5)) list
--f = filter (\x->x>5)
--f = filter (\x-> (>) x 5)
--f = filter (\x-> flip (>) 5 x )
f1 = filter ( flip (>) 5  )
f2 = filter (>5)



--g list = map (\x->x/5) list
--g list = map (\x->x/5) 
--g = map (\x->(/) x 5 )
--g = map (\x-> flip (/) 5 x )
g1 = map ( flip (/) 5  )
g2 = map  (/5)
