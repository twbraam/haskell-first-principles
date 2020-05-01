module ExerciseLookups where

import Data.List (elemIndex)

added :: Maybe Integer
added =
  (+3) <$> (lookup (3 :: Int) $ zip [1, 2, 3] [4, 5, 6])
-----------------
y :: Maybe Integer
y = lookup (3 :: Int) $ zip [1, 2, 3] [4, 5, 6]

z :: Maybe Integer
z = lookup (2 :: Int) $ zip [1, 2, 3] [4, 5, 6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z
-----------------
x :: Maybe Int
x = elemIndex (3 :: Int) [1, 2, 3, 4, 5]

w :: Maybe Int
w = elemIndex (4 :: Int) [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> x <*> w
--------------------
xs :: [Integer]
xs = [1, 2, 3]
ys :: [Integer]
ys = [4, 5, 6]

v :: Maybe Integer
v = lookup 3 $ zip xs ys

u :: Maybe Integer
u = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = sum <$> ((,) <$> v <*> u)
-- sum assumes the same F by using pure here
-- summed = pure sum <*> ((,) <$> v <*> u)
------------------------------------

newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity qw) = Identity (f qw)

instance Applicative Identity where
  pure = Identity
  (<*>) (Identity f) (Identity qw) = Identity (f qw)
-------------------------------------
newtype Constant a b =
  Constant { getConstant :: a }
  deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap _ (Constant a) = Constant a

instance Monoid a
      => Applicative (Constant a) where
  pure _ = Constant mempty
  (<*>) (Constant f) (Constant a) = Constant (mappend f a)
-------------------------------------
