module ExerciseChapter where

import Data.Char

filterUpper :: String -> String
filterUpper xs = filter isUpper xs

capitalize :: String -> String
capitalize (x : xs) = toUpper x : xs
capitalize [] = []

allToUpper :: String -> String
allToUpper xs = map toUpper xs

firstUpper :: String -> Char
firstUpper xs = toUpper $ head xs

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = myOr $ map f xs
