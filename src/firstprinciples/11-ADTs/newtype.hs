{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module Newtype where

newtype Goats =
  Goats Int deriving (Eq, Show, TooMany)
newtype Cows =
  Cows Int deriving (Eq, Show)

tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = n > 42

--------------

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany (Int, String) where
  tooMany (n, _) = n > 42

instance TooMany String where
  tooMany s = s == "veel"

instance TooMany (Int, Int) where
  tooMany (a, b) = (a + b) > 42
