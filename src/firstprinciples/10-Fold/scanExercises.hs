module ScanExercises where

fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs
fibsN :: Int -> Integer
fibsN x = fibs !! x

fibsC :: Int -> [Integer]
fibsC x = take x fibs

fibsUntil :: [Integer]
fibsUntil = takeWhile (\x -> x < 100) fibs

myFactorial :: [Integer]
myFactorial = scanl (*) 1 [2..]
