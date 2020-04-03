module GreetIfCool where

greetIfCool :: String -> IO()
greetIfCool coolness =
  if cool
    then putStrLn "eyyyyy whats shaking?"
  else
    putStrLn "pshhhh.."
  where cool =
          coolness == "downsadsd"
          