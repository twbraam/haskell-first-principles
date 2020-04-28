module CommonlyUsed where

replaceWithP :: b -> Char
replaceWithP = const 'p'

tuple :: (Integer, Char)
tuple = fmap replaceWithP (10, 20 :: Int)
-- (10,'p')

tossEmOne :: Integer -> Integer
tossEmOne = fmap (+1) negate
minus9 :: Integer
minus9 =  tossEmOne 10
--  -9

--------------------

n :: Maybe a
n = Nothing
w :: Maybe [Char]
w = Just "woohoo"
ave :: Maybe [Char]
ave = Just "Ave"
lms :: [Maybe [Char]]
lms = [ave, n, w]


p :: Char
p = replaceWithP lms
ppp :: [Char]
ppp = fmap replaceWithP lms
p_n_p :: [Maybe Char]
p_n_p = (fmap . fmap) replaceWithP lms
ppp_n_ppp :: [Maybe [Char]]
ppp_n_ppp = (fmap . fmap . fmap) replaceWithP lms
--------------------