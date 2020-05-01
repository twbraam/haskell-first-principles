module ExerciseEither where

data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
  fmap f (Second b) = Second (f b)

instance Applicative (Sum a) where
  pure = Second
  (<*>) (First a) _ = First a
  (<*>) _ (First a) = First a
  (<*>) (Second b) (Second b') = Second (b b')
  
instance Monad (Sum a) where
  return = pure
  (>>=) (Second b) f = f b
  (>>=) (First a) _ = First a