

--f list = map (\(a,b) -> 3 * (a+b)) (zip list [1..10])
--f list = map ( (*3) . (uncurry (+))) (zip list [1..10])
--f list = map ( (*3) . (uncurry (+))) (flip zip [1..10] list )
f = map ( (*3) . (uncurry (+))) . (flip zip [1..10]  )

