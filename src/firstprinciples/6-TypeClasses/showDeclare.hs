module ShowDeclare where

import Data.List

--data Mood = Blah
--instance Show Mood where
--  show _ = "Blssah"

data Mood = Blah
          | Woot deriving (Show, Eq)


data Rocks =
  Rocks String deriving (Eq, Show)
data Yeah =
  Yeah Bool deriving (Eq, Show)
data Papu =
  Papu Rocks Yeah deriving (Eq, Show)

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

i :: Num a => a
i = 1

f :: RealFrac a => a
f = 1.0

freud :: Int -> Int
freud x = x

--sigmund :: Num a => a -> a
--sigmund x = 1

jung :: Ord a => [a] -> a
jung xs = head (sort xs)

young :: Ord a => [a] -> a
young xs = head (sort xs)