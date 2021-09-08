{-
The script below contains three syntactic errors.Correct these errors and then check 
that your script works properly using GHCi.

N = a ’div’ length xs 
    where
         a = 10
       xs = [1,2,3,4,5]

error 1: N should be n -- no capital letters for function definitions 
error 2: 'div' is used instead of `div` -- `` is the required syntax for infix functions 
error 3: there is an identation inconsistency in violation of the layout rule 
-}

n = a `div` length xs 
    where
        a = 10 
        xs = [1,2,3,4,5]

{- 

The library function last selects the last element of a non-empty list; 
for ex- ample, last [1,2,3,4,5] “ 5. Show how the function last could be 
defined in terms of the other library functions introduced in this chapter. 
Can you think of another possible definition?

-}

lastList xs = head (reverse xs) 

lastListAlt xs = xs !! (length xs -1)

{-

The library function init removes the last element from a non-empty list; 
for example, init [1,2,3,4,5] “ [1,2,3,4]. Show how init could similarly be defined 
in two different ways.

-}

initAlt1 :: Num a => [a] -> [a]
initAlt1 xs = take (length xs -1) xs

initAlt2 :: Num a => [a] -> [a]
initAlt2 xs = reverse . tail $ reverse xs

