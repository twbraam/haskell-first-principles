module Trivial where

data Trivial =
  Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

divideThenAdd :: Fractional a => a -> a -> a
divideThenAdd x y = (x / y) + 1

