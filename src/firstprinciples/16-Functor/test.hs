module Test where

class Functor' f where
  fmap' :: (a -> b) -> f a -> f b

-----------------------

data FixMePls a =
  FixMe
  | Pls a
  deriving (Eq, Show)

instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls a) = Pls (f a)

-----------------------

data WhoCares a =
  ItDoesnt
  | Matter a
  | WhatThisIsCalled
  deriving (Eq, Show)

instance Functor WhoCares where
  fmap _ ItDoesnt = ItDoesnt
  fmap _ WhatThisIsCalled = WhatThisIsCalled
  fmap f (Matter a) = Matter (f a)

-----------------

data Two a b =
  Two a b
  deriving (Eq, Show)

data Or a b =
  First a
  | Second b
  deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

instance Functor (Or a) where
  fmap _ (First a) = First a
  fmap f (Second b) = Second (f b)

---------------------

data Wrap f a =
  Wrap (f a) --  a is applied to f
  deriving (Eq, Show)

-- if we want to fmap over a, the requirement
-- is that f is a Functor:
instance Functor f
      => Functor (Wrap f) where
  fmap f (Wrap fa) = Wrap (fmap f fa)

wrapJustTwo :: Wrap Maybe Integer
wrapJustTwo = fmap (+1) (Wrap (Just 1))
-- Wrap (Just 2)

