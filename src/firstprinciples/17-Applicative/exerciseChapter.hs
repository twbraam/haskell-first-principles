module ExerciseChapter where

import Control.Applicative (liftA3)

data Pair a = Pair a a deriving Show

instance Functor Pair where 
  fmap f (Pair a b) = Pair (f a) (f b)
instance Applicative Pair where
  pure x = Pair x x
  (<*>) (Pair ax ay) (Pair bx by) = Pair (ax bx) (ay by)

-----------------------------------

data Two a b = Two a b

instance Functor (Two a) where 
  fmap f (Two a b) = Two a (f b)
instance Monoid a => Applicative (Two a) where
  pure = Two mempty
  (<*>) (Two ax ay) (Two bx by) =
    Two (ax <> bx) (ay by)

-----------------------------------

data Three a b c = Three a b c

instance Functor (Three a b) where 
  fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
  pure c = Three mempty mempty c
  (<*>) (Three ax ay az) (Three bx by bz) =
    Three (ax <> bx) (ay <> by) (az bz)

-----------------------------------

data Three' a b = Three' a b b
instance Functor (Three' a) where 
  fmap f (Three' a b b') = Three' a (f b) (f b')

instance Monoid a => Applicative (Three' a) where
  pure b = Three' mempty b b
  (<*>) (Three' ax ay az) (Three' bx by bz) =
    Three' (ax <> bx) (ay by) (az bz)

-----------------------------------

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos a b c = liftA3 (,,) a b c
--combos a b c = (,,) <$> a <*> b <*> c