module DividedBy where

dividedBy1 :: Integral a => a -> a -> a
dividedBy1 num denom = go num denom 0
  where go n d count
         | n < d = count
         | otherwise = 
           go (n - d) d (count + 1)

data DividedResult =
  Result Integer
  | DividedByZero

dividedBy :: Integral a => a -> a -> DividedResult
dividedBy num denom = go num denom 0
  where go n d count
         | d == 0 = DividedByZero
         | n < d = Result count
         | otherwise = 
           go (n - d) d (count + 1)
