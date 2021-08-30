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


applyTwice :: (a -> a) -> a -> a 
applyTwice f x = f (f x) 


zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = [] 
zipWith' _ _ [] = [] 
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y 


map :: (a -> b) -> [a] -> [b]
map _ [] = [] 
map f (x:xs) = f x : map f fx


filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = [] 
filter p (x:xs)
    | p x       = x : filter p xs 
    | otherwise = filter p xs 