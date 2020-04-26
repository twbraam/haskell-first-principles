module Test where

import Data.Monoid
import Data.List.NonEmpty
-- A monoid is a binary associative 
-- operation with an identity.

class Monoid' m where
  mempty' :: m
  mappend' :: m -> m -> m
  mconcat' :: [m] -> m
  mconcat' = foldr mappend' mempty'

-- instance of monoid for lists:
-- instance Monoid' [a] where
--   mempty' :: [a]
--   mempty' = []
--   mappend' = (++)

------ Integer ------

three :: Sum Integer
three = Sum 1 <> Sum 1  <> Sum 1

getThree :: Sum Integer -> (Sum Integer, Integer)
getThree k@(Sum xo) = (k, xo)

------- Maybe ---------

getOne :: First Integer
getOne = 
  First (Just 1) <> 
  First (Just 2)

getTwo :: First Integer
getTwo = First Nothing <> First (Just 2)

---------------

-- data NonEmpty a = a :| [a]
--   deriving (Eq, Ord, Show)

x :: NonEmpty Integer
x = 1 :| [2, 3]

y :: NonEmpty Integer
y = 4 :| [5, 6]

z :: NonEmpty Integer
z = x <> y