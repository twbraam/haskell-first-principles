module ExerciseMaybe where

validateLength :: Int
               -> String
               -> Maybe String
validateLength maxLen s =
  if (length s) > maxLen
  then Nothing
  else Just s

newtype Name =
  Name String deriving (Eq, Show)
newtype Address =
  Address String deriving (Eq, Show)

mkName :: String -> Maybe Name
mkName s =
  fmap Name $ validateLength 25 s

mkAddress :: String -> Maybe Address
mkAddress a =
  fmap Address $ validateLength 100 a


data Person =
  Person Name Address
  deriving (Eq, Show)
mkPerson :: String
         -> String
         -> Maybe Person
mkPerson n a =
  Person <$> mkName n <*> mkAddress a

--------------------------

one :: Maybe [Char]
one = const <$> Just "Hello" <*> Just "World"


two :: Maybe (d -> (Integer, [Char], [Integer], d))
two = pure (,,,) 
  <$> Just (90 :: Int) 
  <*> Just 10
  <*> Just "Tierness"
  <*> pure [1, 2, 3]


