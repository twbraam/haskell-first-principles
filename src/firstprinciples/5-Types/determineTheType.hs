{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example1 = 1
example2 = (* 9) 6
example3 = head [(0,"doge"),(1,"kitteh")]
example4 = head [(0 :: Integer ,"doge"),(1,"kitteh")]
example5 = if False then True else False
example6 = length [1, 2, 3, 4, 5]
example7 = (length [1, 2, 3, 4]) > (length "TACOCAT")

functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y =
  if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y





myFunc :: (x -> y)
       -> (y -> z)
       -> c
       -> (a, x)
       -> (a, z)
myFunc xToY yToZ _ (a, x) = 
  (a, yToZ (xToY x))

i :: a -> a
i a = a


c :: a -> b -> a
c x y = x

r :: [a] -> [a]
r x = reverse x
--r x = drop 1 x

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)

a' :: (a -> b) -> a -> b
a' aToB a = aToB a

