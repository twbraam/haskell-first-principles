module Print3 where

myGreeting :: String
myGreeting = "hello" ++ " world!"

hello :: String
hello = "hello"

world :: String
world = "world!"

main :: IO()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting where
    secondGreeting =
      concat [hello, " ", world]

x = drop 1 "sadas"
z = 1 `drop` "sada"