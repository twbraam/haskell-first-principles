module ExerciseChapter where

-------- Semigroup --------
data Trivial = Trivial deriving (Eq, Show)
instance Semigroup Trivial where
  _ <> _ = Trivial

newtype Identity a = Identity a
instance Semigroup a => Semigroup (Identity a) where
  Identity a <> Identity b = Identity (a <> b)

data Two a b = Two a b
instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two a b <> Two c d = Two (a <> c) (b <> d)

newtype BoolConj = BoolConj Bool
instance Semigroup BoolConj where
  BoolConj a <> BoolConj b = BoolConj (a && b)

newtype BoolDisj = BoolDisj Bool
instance Semigroup BoolDisj where
  BoolDisj a <> BoolDisj b = BoolDisj (a || b)

data Or a b = Fst a | Snd b
instance (Semigroup a, Semigroup b) => Semigroup (Or a b) where
  Snd a <> _     = Snd a
  _     <> Snd b = Snd b
  _     <> b     = b


newtype Combine a b =
  Combine { unCombine :: (a -> b) }
instance (Semigroup a, Semigroup b) => Semigroup (Combine a b) where
  Combine a <> Combine c = Combine (\x -> a x <> c x)

-------- Monoid --------

instance Monoid Trivial where
  mempty = Trivial

instance Monoid a => Monoid (Identity a) where
  mempty = mempty Identity

instance (Monoid a, Monoid b) => Monoid (Two a b) where
  mempty = Two mempty mempty
 
instance Monoid BoolConj where
  mempty = BoolConj True

instance Monoid BoolDisj where
  mempty = BoolDisj False

instance (Monoid a, Monoid b) => Monoid (Combine a b) where
  mempty = Combine mempty
