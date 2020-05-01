module Test where

class Applicative m => Monad' m where
  (>>==) :: m a -> (a -> m b) -> m b
  (>>>) :: m a -> m b -> m b
  returna :: a -> m a

--------------
-- fmap :: Functor f
--      => (a -> b) -> f a -> f b
-- <*> :: Applicative f
--     => f (a -> b) -> f a -> f b
-- >>= :: Monad f
--     => f a -> (a -> f b) -> f b
--------------
bindingAndSequencing :: IO ()
bindingAndSequencing = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn ("y helo thar: " ++ name)

bindingAndSequencing' :: IO ()
bindingAndSequencing' =
  putStrLn "name pls:" >>
  getLine >>= \name ->
    putStrLn ("y helo thar: " ++ name)

-----------------------------
mcomp :: Monad m =>
         (b -> m c)
      -> (a -> m b)
      ->  a -> m c
mcomp f g a = g a >>= f