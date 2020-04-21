module Test where
import Data.List

-- List(1, 3, 8).foldLeft(100)(_ - _) == ((100 - 1) - 3) - 8 == 88
-- List(1, 3, 8).foldRight(100)(_ - _) == 1 - (3 - (8 - 100)) == -94


myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f z xs =
  case xs of
    []     -> z
    (x:xs) -> f x (myFoldr f z xs)

myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs =
  foldr (\x b -> f x || b) False xs

one :: Integer
one = foldr const 0 [1,undefined]

------------------
ar :: [Integer]
ar = scanr (+) 0 [1..5]
-- [15,14,12,9,5,0]

el :: [Integer]
el = scanl (+) 0 [1..5]
-- [0,1,3,6,10,15]