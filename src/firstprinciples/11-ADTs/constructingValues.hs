module ConstructingValues where

data GuessWhat =
  Chickenbutt deriving (Eq, Show)
  
data Id a =
  MkId a deriving (Eq, Show)

data Product a b =
  Product a b deriving (Eq, Show)

data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

data RecordProduct a b =
  RecordProduct { pfirst :: a
  , psecond :: b }
  deriving (Eq, Show)
-----------

newtype NumCow =
  NumCow Int
  deriving (Eq, Show)
newtype NumPig =
  NumPig Int
  deriving (Eq, Show)

data Farmhouse =
  Farmhouse NumCow NumPig
  deriving (Eq, Show)

type Farmhouse' = Product NumCow NumPig

----------
type Name = String
type Age = Int
type LovesMud = Bool
type PoundsOfWool = Int
data CowInfo =
  CowInfo Name Age
  deriving (Eq, Show)

data PigInfo =
  PigInfo Name Age LovesMud
  deriving (Eq, Show)
data SheepInfo =
  SheepInfo Name Age PoundsOfWool
  deriving (Eq, Show)
data Animal =
  Cow CowInfo
  | Pig PigInfo
  | Sheep SheepInfo
  deriving (Eq, Show)
-- Alternately
type Animal' =
  Sum CowInfo (Sum PigInfo SheepInfo)


bess' :: CowInfo
bess' = (CowInfo "Bess" 4)
bess :: Animal'
bess = First bess' :: Animal'

e' :: Sum a SheepInfo
e' = Second (SheepInfo "Elmer" 5 5)
elmer :: Animal'
elmer = Second e' :: Animal'


elmo' :: Sum PigInfo b
elmo' = First (PigInfo "Elmo" 23 True)
elmo :: Animal'
elmo = Second elmo' :: Animal'

----------------
type Awesome = Bool

person :: Product Name Awesome
person = Product "Simon" True

type Twitter = String
type AskFm = String

twitter :: Sum Twitter AskFm
twitter = First "Twitter"
askfm :: Sum Twitter AskFm
askfm = First "AskFm"