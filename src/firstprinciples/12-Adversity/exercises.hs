module Exercises where

notThe :: String -> Maybe String
notThe s = case s == "the" of
  True  -> Nothing
  False -> Just s

replaceThe :: String -> String
replaceThe xs = unwords $ map f $ words xs
  where f x = case (notThe x) of
          Nothing -> "a"
          Just s -> s

isVowel :: Char -> Bool
isVowel = (`elem` "aeiouAEIOU")

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel "" = 0
countTheBeforeVowel s  = (
                         if firstWord == "the" && beginWithVowel otherWordsTrim
                            then 1
                            else 0
                         )
                         + countTheBeforeVowel otherWordsTrim
                        where (firstWord, otherWords) = span (/= ' ') s
                              otherWordsTrim = dropWhile (== ' ') otherWords
                              beginWithVowel "" = False
                              beginWithVowel (x:_) = isVowel x

countVowels :: String -> Integer
countVowels = count isVowel

countNotVowels :: String -> Integer
countNotVowels = count (not . isVowel)

count :: (Char -> Bool) -> String -> Integer
count f = fromIntegral . length . filter f


newtype Word' =
  Word' String
  deriving (Eq, Show)

vowels :: [Char]
vowels = "aeiou"
mkWord :: String -> Maybe Word'
mkWord xs = case (countVowels xs > countNotVowels xs) of
              True -> Nothing
              False -> Just (Word' xs)

------------------

data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)


natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ nat) = 
  succ (natToInteger nat)

integerToNat :: Integer -> Maybe Nat
integerToNat n
    | n < 0     = Nothing
    | otherwise = Just (go n)
    where go n2 = 
            if n2 == 0 then Zero 
            else Succ (go (pred n2))