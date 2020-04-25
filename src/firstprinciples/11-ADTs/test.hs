module Test where

data Doggies a =
 -- type constructor
    Husky a
 -- data constructor / type argument
  | Mastiff a
  deriving (Eq, Show)

-- :k Doggies
-- Doggies :: * -> *

-- :t Husky
-- Husky :: a -> Doggies a

-------------------------

data FlowerType = Gardenia
   | Daisy
   | Rose
   | Lilac
   deriving Show

type Gardener = String

data Garden = Garden Gardener FlowerType
            deriving Show

-- data Garden = GardenG Gardener Gardenia
--             | GardenD Gardener Daisy
--             | GardenR Gardener Rose
--             | GardenL Gardener Lilac