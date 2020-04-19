module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n
  | n == 1 = "one"
  | n == 2 = "two"
  | n == 3 = "three"
  | n == 4 = "four"
  | n == 5 = "five"
  | n == 6 = "six"
  | n == 7 = "seven"
  | n == 8 = "eight"
  | n == 9 = "nine"
  | otherwise = "zero"

digits :: Int -> [Int]
digits num = go num []
  where go n acc
         | n < 10 = [n] ++ acc
         | otherwise = go (div n 10) ([mod n 10] ++ acc)

wordNumber :: Int -> String
wordNumber n = do
  let digs = digits n
  let wors = map digitToWord digs
  let inte = intersperse "-" wors
  concat inte