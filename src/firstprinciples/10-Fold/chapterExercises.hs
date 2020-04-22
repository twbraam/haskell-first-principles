module ChapterExercises where

stops :: String
stops = "pbtdkg"
vowels :: String
vowels = "aeiou"

combs :: [(Char, Char, Char)]
combs = [(s1, v, s2) | 
  s1 <- stops,
  v  <- vowels,
  s2 <- stops,
  s1 == 'p'
  ]

----------------

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x acc -> (f x) || acc) False

myAny' :: (a -> Bool) -> [a] -> Bool
myAny' f = foldr go False
  where go x = (||) (f x)

myElem :: Eq a => a -> [a] -> Bool
myElem n = foldr (\x acc -> x == n || acc) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' n = foldr go False
  where go x = (||) (n == x)

myElem'' :: Eq a => a -> [a] -> Bool
myElem'' n = any ((==) n)

myReverse :: [a] -> [a]
myReverse = foldl (flip(:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr go []
  where go x = (:) (f x)
