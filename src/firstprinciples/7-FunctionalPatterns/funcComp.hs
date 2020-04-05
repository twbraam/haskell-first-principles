module FuncComp where

addOne :: Num a => a -> a
addOne x = x + 1
subtractTwo :: Num a => a -> a
subtractTwo x = x - 2

minusOne :: Num a => a -> a
minusOne = subtractTwo . addOne

y :: [Integer]
y = take 5 (enumFrom 3)

z :: [Integer]
z = take 5 . enumFrom $ 3

x :: [Integer]
x = take 5 . filter odd . enumFrom $ 3
-- [3,5,7,9,11]