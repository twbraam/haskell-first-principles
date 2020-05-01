module ExerciseChapter where

data Nope a =
  NopeDotJpg

instance Functor Nope where
  fmap _ NopeDotJpg = NopeDotJpg
instance Applicative Nope where
  pure _ = NopeDotJpg
  (<*>) NopeDotJpg NopeDotJpg = NopeDotJpg
instance Monad Nope where
  return = pure
  (>>=) NopeDotJpg _ = NopeDotJpg

-----------------------------
data PhhhbbtttEither b a =
    Lefta a
  | Righta b

instance Functor (PhhhbbtttEither b) where
  fmap _ (Righta a) = Righta a
  fmap f (Lefta a) = Lefta (f a)
instance Applicative (PhhhbbtttEither b) where
  pure = Lefta
  (<*>) (Righta f) _ = Righta f
  (<*>) _ (Righta f) = Righta f
  (<*>) (Lefta f) (Lefta x) = Lefta (f x)
instance Monad (PhhhbbtttEither b) where
  return = pure
  (>>=) (Righta x) _ = Righta x
  (>>=) (Lefta x) f = f x

-------------------

newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)
instance Applicative Identity where
  pure = Identity
  (<*>) (Identity a) (Identity b)= Identity (a b)
instance Monad Identity where
  return = pure
  (>>=) (Identity a) f = f a

-------------------

data List a =
    Nil
  | Cons a (List a)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)
instance Applicative List where
  pure x = Cons x Nil
  (<*>) _ Nil = Nil
  (<*>) Nil _ = Nil
  (<*>) (Cons f fs) xs = (f <$> xs) `append` (fs <*> xs)

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

instance Monad List where
  return = pure
  (>>=) (Cons x xs) f = append (f x) (xs >>= f)
---------------------------

j :: Monad m => m (m a) -> m a
j m = m >>= id