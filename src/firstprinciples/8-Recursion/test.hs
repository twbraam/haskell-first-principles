module Test where

brokenFact1 :: Integer -> Integer
brokenFact1 n = n * brokenFact1 (n - 1)

y :: Integer
y = brokenFact1 4

inc :: Num a => a -> a
inc = (+1)
three :: Integer
three = inc . inc . inc $ 0
three' :: Integer -- different syntax, same thing
three' = (inc . inc . inc) 0

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n =
  1 + (incTimes(times - 1) n)

applyTimes :: (Eq a, Num a) =>
  a -> (b -> b) -> b -> b
applyTimes 0 _ n = n
applyTimes times func n =
  func (applyTimes(times - 1 ) func n)
--f . applyTimes(times - 1 ) f $ n

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (+1) n

-- ------------------
f :: Bool -> Int
f False = 0
f True = error "blah"


f' :: Bool -> Maybe Int
f' False = Just 0
f' _ = Nothing

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = 
  fibonacci (n - 1) + fibonacci (n - 2)
