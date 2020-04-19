module EnumFromTo where

eftBool :: Bool -> Bool -> [Bool]
eftBool x y
        | x == y = [y]
        | x < y = x : eftBool (succ x) y
        | otherwise = []



eftOrd :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd x y
  | x == y = [y]
  | x < y = x : eftOrd (succ x) y
  | otherwise = []

eftInt :: Int -> Int -> [Int]
eftInt x y
  | x == y = [y]
  | x < y = x : eftInt (succ x) y
  | otherwise = []

eftChar :: Char -> Char -> [Char]
eftChar x y
  | x == y = [y]
  | x < y = x : eftChar (succ x) y
  | otherwise = []