module ExerciseChapter where
import Data.Char
import Data.List

cipher :: String -> String -> String
cipher input kw = map shift $zipped input kw

zipped :: String -> String -> [(Char, Char)]
zipped input kw = zip input $concat $repeat kw

shift :: (Char, Char) -> Char
shift (c, c')
  | c == ' ' = c
  | otherwise = c''
        where diff = ord c' - ord 'A'
              c'' = chr $ ((ord c - ord 'A' + diff) `mod` 26) + ord 'A'

-----

isSubseqOf :: (Eq a)
           => [a]
           -> [a]
           -> Bool
isSubseqOf a b =
  foldr f True a
    where f i x = x && elem i b

capitalizeWords :: String
                -> [(String, String)]
capitalizeWords s =
  map f (words s)
    where 
      f w@(h:t) = (w, toUpper h : t)
      f [] = ("", "")
-------------

capitalizeWord :: String -> String
capitalizeWord (h:t) = toUpper h : t
