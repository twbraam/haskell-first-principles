module Test where

-- data [] a = [] | a : [a]

-- 1 : [2, 3, 4, 5]
myTail :: [a] -> Maybe [a]
myTail (_ : []) = Nothing
myTail []       = Nothing
myTail (_ : xs) = Just xs



stringList :: String
stringList = ['a'..'x']
increaseBy :: [Integer]
increaseBy = [1,3..10]
