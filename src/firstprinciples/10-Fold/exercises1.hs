module Exercises1 where

a :: [Char]
a = foldr (++) [] ["woot", "WOOT", "woot"]

b :: Char
b = foldr max 'a' "fear is the little death"

c :: Bool
c = foldr (&&) True [False, True]

e :: [Char]
e = foldl (flip((++) . show)) "" [1..5]

f :: Char
f = foldl const 'a' [1..5]

g :: Integer
g = foldl const 0 "tacos"

h :: Integer
h = foldr (flip const) 0 "burritos"

i :: Char
i = foldr (flip const) 'z' [1..5]