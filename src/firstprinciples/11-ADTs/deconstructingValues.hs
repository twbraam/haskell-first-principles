module DeconstructingValues where

newtype Name = Name String deriving Show
newtype Acres = Acres Int deriving Show
-- FarmerType is a Sum
data FarmerType = DairyFarmer
  | WheatFarmer
  | SoybeanFarmer
  deriving Show

data Farmer =
  Farmer Name Acres FarmerType
  deriving Show

farmerHenk :: Farmer
farmerHenk = Farmer (Name "Henk") (Acres 23) WheatFarmer

farmerEric :: Farmer
farmerEric = Farmer (Name "Eric") (Acres 46) SoybeanFarmer

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) =
  True
isDairyFarmer _ =
  False

isHenk :: Farmer -> Bool
isHenk (Farmer (Name a) _ _) = a == "Henk"

data FarmerRec =
  FarmerRec { name :: Name
            , acres :: Acres
            , farmerType :: FarmerType }
            deriving Show
isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmer =
  case farmerType farmer of
    DairyFarmer -> True
    _ -> False

