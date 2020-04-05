module CasePractice where

functionC :: Ord p => p -> p -> p
functionC x y = case (x > y) of
  True -> x
  False -> y


ifEvenAdd2 :: Integral p => p -> p
ifEvenAdd2 n = case even n of
  True -> (n+2) 
  False -> n


nums :: (Ord a, Num a, Num p) => a -> p
nums x =
  case compare x 0 of
    EQ -> 0
    LT -> -1
    GT -> 1


flip :: (a -> b -> c) -> b -> a -> c
flip f x y = f y x