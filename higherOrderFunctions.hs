multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z 

compareWithHundred :: (Num a, Ord a) => a -> Ordering 
-- compareWithHundred x = compare 100 x 
-- a better way to right this is 
compareWithHundred = compare 100 

divideByTen :: (Floating a) => a -> a 
divideByTen = (/10)
-- calling divideByTen 200 is equivalent to doing 200 / 10, 
-- as is also (/10) 200

-- a funciton that checks if a supplied character is an upper case letter 
isUpperAlphanum :: Char -> Bool 
isUpperAlphanum = (`elem` ['A'..'Z'])