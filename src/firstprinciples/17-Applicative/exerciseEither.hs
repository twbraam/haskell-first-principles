data Validation e a =
    Failure e
  | Success a
  deriving (Eq, Show)


instance Functor (Validation e) where
  fmap f (Success x)= Success (f x)
  fmap _ (Failure x)= Failure x
  

instance Monoid e =>
  Applicative (Validation e) where
  pure = Success
  (<*>) (Failure f) (Success _) = Failure f
  (<*>) (Success _) (Failure f) = Failure f
  (<*>) (Success s) (Success s') = Success (s s')
  (<*>) (Failure f) (Failure f') = Failure (f <> f')

data Errors =
  DividedByZero
  | StackOverflow
  | MooglesChewedWires
  deriving (Eq, Show)

-- one = Success (+1) <*> Success 1
two :: Validation [Errors] Integer
two = Success (+1) <*> Failure [StackOverflow]
three :: Validation [Errors] b
three = Failure [MooglesChewedWires] <*> Failure [StackOverflow]