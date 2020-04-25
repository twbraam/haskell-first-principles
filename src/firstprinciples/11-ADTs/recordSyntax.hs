module RecordSyntax where

data Person =
  Person { name :: String
          , age :: Int }
          deriving (Eq, Show)


data OperatingSystem =
  GnuPlusLinux
  | OpenBSDPlusNevermindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show)
data ProgLang =
  Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show)
data Programmer =
  Programmer { os :: OperatingSystem
  , lang :: ProgLang }
  deriving (Eq, Show)

nineToFive :: Programmer
nineToFive = Programmer {
    os = Mac
  , lang = Haskell }

feelingWizardly :: Programmer
feelingWizardly =
  Programmer { 
      lang = Agda
    , os = GnuPlusLinux }

