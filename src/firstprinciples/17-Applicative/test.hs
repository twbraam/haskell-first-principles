module Test where


class Functor f => Applicative2 f where
  pure' :: a -> f a
  (<**>) :: f (a -> b) -> f a -> f b

------------------
list :: [Int]
list = pure 1 :: [Int]
-- [1]
maybez :: Maybe Int
maybez = pure 1 :: Maybe Int
-- Just 1
eitherz :: Either a Int
eitherz = pure 1 :: Either a Int
-- Right 1
tuple :: ([a], Int)
tuple = pure 1 :: ([a], Int)
-- ([],1)

-------------------------

-- [(*2), (*3)] <*> [4, 5]
-- =
-- [2 * 4, 2 * 5, 3 * 4, 3 * 5]
-- So we are applying a list of functions to
-- a list of values


budong :: ([Char], Integer)
budong = ("Woo", (+1)) <*> (" Hoo!", 0)
-- ("Woo Hoo!", 1)

--------------------
-- (,) <$> [1, 2] <*> [3, 4]
-- = 
-- liftA2 (,) [1, 2] [3, 4]
-- = 
-- [(1,3),(1,4),(2,3),(2,4)]
--------------------
-- (++) <$> (Just "ASD") <*> (Just "12312")
-- =
-- Just "ASD12312"
