module AbsoluteNum where

absoluteNum :: Integer -> Integer
absoluteNum x = 
  if x < 0
  then (-x)
  else x
