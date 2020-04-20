module FilterZip where

onlyMultipleOfThree :: [Integer]
onlyMultipleOfThree = 
  filter (\x -> (rem x 3) == 0)[1..30]

oneTwoThree :: [Integer]
oneTwoThree =
  fst $ unzip $ zip [1, 2, 3] [4 :: Integer, 5, 6]

zipAndFunction :: [Integer]
zipAndFunction = 
  zipWith (+) [1, 2, 3] [10, 11, 12]

