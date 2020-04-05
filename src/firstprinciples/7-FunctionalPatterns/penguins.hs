module Penguins where

data Penguin =
  Peng WherePenguinsLive
  deriving (Eq, Show)

data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)

isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _ = False

gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) = whereitlives

-- unpacking multiple arguments
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))



g :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
g (a, _, c) (d, _, h) = ((a, d), (c, h))
