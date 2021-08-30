-- Maximum awesome
-- Test comments 

maximum' :: (Ord a) => [a] -> a

maximum' []     = error "maximum of empty list"
maximum' [x]    = x
maximum' (x:xs) = max x (maximum' xs)


replicate' :: (Num i, Ord i) => i -> a -> [a]

replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n-1) x 


take' :: (Num i, Ord i) => i -> [a] -> [a]

take' n _ 
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) =  x : take' (n-1) xs


reverse' :: [a] -> [a]

reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]


repeat' :: a -> [a]

repeat' x = x:repeat' x


zip' :: [a] -> [b] -> [(a,b)]

zip' _ []          = []
zip' [] _          = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


elem' :: (Eq a) => a -> [a] -> Bool

elem' a [] = False 
elem' a (x:xs)
    | a == x = True 
    | otherwise = a `elem'` xs 

-- another way to do elem'
-- _ is a wild card that does not matter what is put their 
elem'' _ [] = False 
-- || is a boolean OR 
elem'' e (x:xs) = (e == x) || (elem e xs)


quicksort :: (Ord a) => [a] -> [a]

quicksort [] = [] 
quicksort (x:xs) = 
    let smallerSorted = quicksort (filter (<=x) xs) -- OR use a list comprehension -> [a | a <- xs, a <= x]
        biggerSorted = quicksort (filter (>x) xs) -- OR use a list comprehension -> [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted


-- create a function that removes all duplicates from a given list 
nub :: (Eq a) => [a] -> [a] 
nub [] = [] 
nub (x:xs)
    -- this uses the infix version of elem' but you could right 
    -- elem x xs -- and it would be the same using the prefix
    | x `elem'` xs = nub xs 
    | otherwise    = x : nub xs

-- create a function isAsc that returns True fit eh list given 
-- is in ascending order 
isAsc :: [Int] -> Bool
isAsc [] = True  
isAsc [x] = True 
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

-- create a function hasPath that determines if a path from one node 
-- to another exists within a directed graph 
hasPath :: [(Int,Int)] -> Int -> Int -> Bool 
hasPath [] x y = x == y
hasPath xs x y 
    | x == y    = True 
    | otherwise = 
        let xs' = [ (n,m) | (n,m) <- xs, n /= x ] in
            or [ hasPath xs' m y | (n,m ) <- xs, n == x ]
