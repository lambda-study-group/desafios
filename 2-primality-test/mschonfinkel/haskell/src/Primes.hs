module Primes where

import Sieve

primesUpToSqrt :: Integer -> [Integer]
primesUpToSqrt n = take k primes
    where
        k = floor $ sqrt (fromInteger n)

checkPrimalityWithSieve :: Integer -> Bool
checkPrimalityWithSieve n = all (/= 0) mapped
        where
            primesList = primesUpToSqrt n
            mapped = map (\x -> n `mod` x) primesList

isPrime :: Integer -> Bool
isPrime n
    | n < 2 = False
    | n == 2 = True
    | otherwise = checkPrimalityWithSieve n
