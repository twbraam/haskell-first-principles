module Cipher where

import Data.Char

cipher :: String -> Int -> String
cipher xs n = map (moveRight n) xs

moveRight :: Int -> Char -> Char
moveRight n x = chr $ ord x + (mod n 26)