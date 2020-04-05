module IfThenElse where

f :: (Eq a, Num a) => a -> [Char]
f x = if x + 1 == 1 then "AWESOME" else "wut"

g :: (Eq a, Num a) => a -> [Char]
g x = case x + 1 == 1 of
    True -> "AWESOME"
    False -> "wut"


-- :{
-- if (x + 1 == 1)
-- then "AWESOME"
-- else "wut"
-- :}

myAbs :: Integer -> Integer
myAbs x
  | x < 0 = (-x)
  | otherwise = x

