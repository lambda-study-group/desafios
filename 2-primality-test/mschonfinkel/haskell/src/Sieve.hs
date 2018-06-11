{- Eratosthenes' sieve
    The following implementations is a transcription
    of Richard Bird's list based implementation in the 
    lasts pages of the article here:
        https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
-}

module Sieve where

primes :: [Integer]
primes = 2 : ([3..] `minus` composites)
    where
        composites = union [multiples p | p <- primes]

multiples :: Integer -> [Integer]
multiples = \n -> map (*n) [n..]

minus :: Ord a => [a] -> [a] -> [a]
(x:xs) `minus` (y:ys)
    | x < y = x : (xs `minus` (y:ys)) 
    | x == y = xs `minus` ys
    | x > y = y : ((x:xs) `minus` ys)

union = foldr merge []

merge :: Ord a => [a] -> [a] -> [a]
merge (x:xs) ys = x : merge' xs ys

merge' :: Ord a => [a] -> [a] -> [a]
merge' (x: xs) (y: ys)
    | x < y = x : merge' xs (y:ys)
    | x == y = x : merge' xs ys
    | x > y = y : merge' (x:xs) ys

