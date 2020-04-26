
---- left identity
-- mappend mempty x = x
---- right identity
-- mappend x mempty = x
---- associativity
-- mappend x (mappend y z) =
--   mappend (mappend x y) z
--
-- mconcat = foldr mappend mempty
