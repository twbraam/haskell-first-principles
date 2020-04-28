data Sum a b =
    First a
  | Second b
instance Functor (Sum e) where
  fmap _ (First a) = First a
  fmap f (Second b) = Second (f b)

data Company a b c =
    DeepBlue a c
  | Something b
instance Functor (Company e e') where
  fmap _ (Something b) = Something b
  fmap f (DeepBlue a c) = DeepBlue a (f c)

data More a b =
    L b a b
  | R a b a
  deriving (Eq, Show)
instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'

  --------------------

data Quant a b =
    Finance
  | Desk a
  | Bloor b
instance Functor (Quant a) where
  fmap _ Finance = Finance
  fmap _ (Desk a) = Desk a
  fmap f (Bloor b) = Bloor (f b)

data K a b =
  K a
instance Functor (K a) where
  fmap _ (K a) = K a

data Parappa f g a =
  DaWrappa (f a) (g a)
instance (Functor f, Functor g) => 
         Functor (Parappa f g) where
  fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga)

