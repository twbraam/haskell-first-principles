module ListComprehension where

listIf :: [Integer]
listIf = [x^(2 :: Integer) | x <- [1..10], rem x 2 == 0]

list2 :: [Integer]
list2 = [x^(y :: Integer) | x <- [1..5], y <- [2, 3]]

useAnotherList :: [(Integer, Integer)]
useAnotherList = [(x, y) | x <- listIf, y <- list2]

--------------------
mySqr :: [Integer]
mySqr = [x^(2 :: Integer) | x <- [1..5]]

try :: [(Integer, Integer)]
try = [(x, y) | 
  x <- mySqr,
  y <- mySqr,
  x < 50,
  y > 50]
-- [(1,64),(1,81),(1,100),(4,64),(4,81),(4,100),(9,64),(9,81),(9,100),(16,64),(16,81),(16,100),(25,64),(25,81),(25,100),(36,64),(36,81),(36,100),(49,64),(49,81),(49,100)]

myCube :: [Integer]
myCube = [y^(3 :: Integer) | y <- [1..5]]

sqrCubeTupled :: [(Integer, Integer)]
sqrCubeTupled = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]
sqrCubeTupledSize :: Int
sqrCubeTupledSize = length sqrCubeTupled