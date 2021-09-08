import Data.List 
--- if we only wanted a couple functions from Data.List 
-- we would do this 
-- import Data.List (num, sort)
-- to hide a function from a module you can go like this 
-- import Data.List hiding (nub)
-- if name clashes are present we can solve that like this 
-- import qualified Data.Map as M 
-- then call functions from the module like this 
-- M.filter 

numUniques :: (Eq a) => [a] -> Int 
numUniques = length . nub 