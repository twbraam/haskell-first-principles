module DayOfWeek where

data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Ord, Enum, Show)

data Date =
  Date DayOfWeek Int
  deriving Show

--instance Ord DayOfWeek where
--  compare Fri Fri = EQ
--  compare Fri _   = GT
--  compare _ Fri   = LT
--  compare _ _     = EQ

--instance Eq DayOfWeek where
--  (==) Mon Mon = True
--  (==) Tue Tue = True
--  (==) Wed Wed = True
--  (==) Thu Thu = True
--  (==) Fri Fri = True
--  (==) Sat Sat = True
--  (==) Sun Sun = True
--  (==) _ _     = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') = 
         weekday == weekday' &&
         dayOfMonth == dayOfMonth'

f :: Int -> Bool
f 2 = True
f _ = False

data Identity a =
  Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

--instance Ord a => Eq (Identity a) where
--  (==) (Identity v) (Identity v') =
--    compare v v' == EQ