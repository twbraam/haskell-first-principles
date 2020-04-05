module Pointfree where

add :: Int -> Int -> Int
add x y = x + y
addPF :: Int -> Int -> Int
addPF = (+)
addOne :: Int -> Int
addOne = \x -> x + 1
addOnePF :: Int -> Int
addOnePF = (+1)


print :: Show a => a -> IO ()
print a = (putStrLn . show) a

printPF :: Show a => a -> IO ()
printPF = putStrLn . show