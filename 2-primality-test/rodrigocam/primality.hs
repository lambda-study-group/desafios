
primes = 
    sieve [2..]
    where
        sieve (p:xs) = p : sieve [n | n <- xs, n `mod` p /= 0]

main = do
    input <- getLine
    let number = read input :: Integer
    print $ number `elem` primes 