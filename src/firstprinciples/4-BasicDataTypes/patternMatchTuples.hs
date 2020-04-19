module PatternMatchTuples where

fst' :: (a, b) -> a
fst' (a, _) = a

snd' :: (a, b) -> b
snd' (_, b) = b




tupFunc :: (Int, [a])
        -> (Int, [a])
        -> (Int, [a])
tupFunc (a, b) (c, d) =
  ((a + c), (b ++ d))