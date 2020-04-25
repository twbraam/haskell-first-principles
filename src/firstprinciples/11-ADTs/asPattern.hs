module AsPattern where

f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
  print a
  return t

-- f (1, 2)
-- > 1
-- > (1, 2)