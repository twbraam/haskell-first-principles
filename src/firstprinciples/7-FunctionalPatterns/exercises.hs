module Exercises where

nDigit :: (Integral a) => a -> a -> a
nDigit x n = d
  where m = \y  -> (y `divMod` n)
        d = (fst . m) x

tensDigit :: Integral a => a -> a
tensDigit x = nDigit x 10

hunDigit :: Integral a => a -> a
hunDigit x = nDigit x 100

--------------------

roundTrip :: (Show a, Read a) => a -> a
roundTrip = read . show

main :: IO ()
main = do
  print (roundTrip 4 :: Int)
  print (id 4 :: Int)

