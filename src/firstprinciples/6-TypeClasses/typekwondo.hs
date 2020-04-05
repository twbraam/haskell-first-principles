module TypeKwondo where

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f1 a b = (f1 a) == b

arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b
arith f1 i a = (f1 a) + (fromInteger i)

