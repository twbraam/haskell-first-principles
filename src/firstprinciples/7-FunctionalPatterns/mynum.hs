myNum :: Num a => a
myNum = 1

myVal :: Num a => a -> a
myVal f = f + myNum

stillAFunction :: [a] -> [a] -> [a] -> [a]
stillAFunction a b c = a ++ b ++ c

bindExp :: Integer -> String
bindExp x =
  let y = 5 in
    let z = y + x in
      "the integer was: "
      ++ show x ++ " and y was: "
      ++ show y ++ " and z was: "
      ++ show z

--shadowed :: Integer -> String
--shadowed x =
--  let x = 10; y = 5 in
--  "the integer was: " ++ show x
--  ++ " and y was: " ++ show y