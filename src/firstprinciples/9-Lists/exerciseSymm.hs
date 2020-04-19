module ExerciseSymm where

myWords :: String -> [String]
myWords x = mySplit x ' '

myLines :: String -> [String]
myLines x = mySplit x '\n'

mySplit :: String -> Char -> [String]
mySplit x c
  | x == [] = []
  | head x /= c = 
    takeWhile (/= c) x : 
    mySplit (dropWhile (/= c) x) c
  | otherwise = 
    mySplit (dropWhile (== c) x) c