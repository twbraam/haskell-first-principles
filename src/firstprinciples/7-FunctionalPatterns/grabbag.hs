module GrabBag where

mTh :: Num a => a -> a -> a -> a
mTh x y z = x * y * z

mTh2 :: Num a => a -> a -> a -> a
mTh2 x y = \z -> x * y * z

mTh3 :: Num a => a -> a -> a -> a
mTh3 x = \y -> \z -> x * y * z

mthA :: Integer -> Integer -> Integer
mthA = mTh 3

addOneIfOdd :: Integral p => p -> p
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f  = (\q -> q + 1)

addFive :: (Num a, Ord a) => a -> a -> a
addFive = \x -> \y -> 
  (if x > y then y else x) + 5

mflip :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
mflip f x y = f y x