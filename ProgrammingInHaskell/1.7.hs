-- Give another possible calculation for the result of double (double 2)

doubleFourTimes :: Num a => a -> a 
doubleFourTimes x = 2 * (x + x)

-- Define a function product that produces the product of a list of numbers, 
-- and show using your definition that product [2,3,4] = 24

productList :: Num a => [a] -> a 
productList [] = 1
productList (x:xs) = x * productList xs 