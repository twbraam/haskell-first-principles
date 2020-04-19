module Review where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y
-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

ex2 :: (Eq a, Num a) => a -> a
ex2 num = go num 0
  where go n acc
         | n == 0 = acc
         | otherwise =
           go (n-1)(acc + n)

ex3 :: (Integral a) => a -> a -> a
ex3 ex en = go ex en 0
  where go x n acc
         | n == 0 = acc
         | otherwise =
           go x (n-1)(acc + x)

-- ---------------------
mc91 :: (Integral a) => a -> a
mc91 n
   | n > 100 = n - 10
   | otherwise =
     mc91 (mc91 (n + 11))

testmc91 :: [Integer]
testmc91 = map mc91 [95..110]
-- ----------------------
