-- multThree :: (Num a) => a -> a -> a -> a
-- multThree x y z = x * y * z 

-- compareWithHundred :: (Num a, Ord a) => a -> Ordering 
-- -- compareWithHundred x = compare 100 x 
-- -- a better way to right this is 
-- compareWithHundred = compare 100 

-- divideByTen :: (Floating a) => a -> a 
-- divideByTen = (/10)
-- -- calling divideByTen 200 is equivalent to doing 200 / 10, 
-- -- as is also (/10) 200

-- -- a funciton that checks if a supplied character is an upper case letter 
-- isUpperAlphanum :: Char -> Bool 
-- isUpperAlphanum = (`elem` ['A'..'Z'])


-- applyTwice :: (a -> a) -> a -> a 
-- applyTwice f x = f (f x) 


-- zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
-- zipWith' _ [] _ = [] 
-- zipWith' _ _ [] = [] 
-- zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


-- flip' :: (a -> b -> c) -> b -> a -> c
-- flip' f y x = f x y 


-- -- map :: (a -> b) -> [a] -> [b]
-- -- map _ [] = [] 
-- -- map f (x:xs) = f x : map f fx
-- -- implement the map function with a right fold 
-- -- map' (a -> b) -> [a] -> [b]
-- -- map ' f xs = foldr (\x acc -> f x : acc) [] xs


-- filter :: (a -> Bool) -> [a] -> [a]
-- filter _ [] = [] 
-- filter p (x:xs)
--     | p x       = x : filter p xs 
--     | otherwise = filter p xs 



-- largestDivisible :: (integral a) => a 
-- largestDivisible = head (filter p [100000, 99999..])
--     where p x = x `mod` 3829 == 0 


chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2) 
    | odd n = n:chain (n*3 + 1)


-- too run the code below you need to comment out above lines EXCEPT for `chain`

numLongChains :: Int 
--numLongChains = length (filter isLong (map chain [1..100]))
    --where isLong xs = length xs > 15 
-- we can write the above code more precisely by using a lambda "\"
--numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))


-- the sum function, but using a fold instead of explicit recursion 
sum' :: (Num a) => [a] -> a 
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
-- the lambda function (\acc x -> acc + x) is the same as (+)
-- b/c functions are curried in Haskell, we can re-write the function as follows 
sum' = foldl (+) 0 


-- Implement `elem` with a left fold 
elem' :: (Eq a) => a -> [a] -> Bool 
elem' y ys = foldl (\acc x -> if x ==y then True else acc) False ys 


-- implement a bunch of standard library functins by using folds 
maximum' :: (Ord a) => [a] -> a 
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a] 
reverse' = foldl (\acc x -> x : acc) [] 

product' :: (Num a) => [a] -> a 
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a] 
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a 
head' = foldr1 (\x _ -> x)

last' :: [a] -> a 
last' = foldl1 (\_ x -> x)


sqrtSums :: Int 
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1



($) :: (a -> b) -> a -> b 
f $ x = f x 


(.) :: (b -> c) -> (a -> b) -> a -> c 
f . g = \x -> f (g x) 