module ReverseNumber where
import Data.Foldable

reverseNumber :: Integer -> Integer
reverseNumber number = go $ number
  where go x = read $ foldl' (flip (:)) "" (show x) :: Integer

main :: IO ()
main = do
    print $ reverseNumber 1234
    print $ reverseNumber 12
    print $ reverseNumber 0 
    print $ reverseNumber 6641112222223333333345678901118
