module ExerciseZipList where

data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

instance Applicative List where
  pure x = Cons x Nil
  (<*>) Nil _ = Nil
  (<*>) _ Nil = Nil
  (<*>) (Cons f fs) xs = (f <$> xs) `append` (fs <*> xs)

take' :: Int -> List a -> List a
take' 0 _ = Nil
take' _ Nil = Nil
take' n (Cons x xs) = Cons x (take' (n-1) xs)


newtype ZipList' a =
  ZipList' (List a)
  deriving (Eq, Show)

instance Functor ZipList' where
  fmap f (ZipList' xs) =
    ZipList' $ fmap f xs

instance Applicative ZipList' where
  pure x = ZipList' $ repeat' x
  (<*>) _ (ZipList' Nil) = ZipList' Nil
  (<*>) (ZipList' Nil) _ = ZipList' Nil
  (<*>) (ZipList' fs) (ZipList' xs) =
    ZipList' (zipWith' id fs xs)

repeat' :: a -> List a
repeat' x  = xs
  where xs = Cons x xs

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _                   = Nil
zipWith' _ _ Nil                   = Nil
zipWith' f (Cons x xs) (Cons y ys) = Cons (f x y) (zipWith' f xs ys)