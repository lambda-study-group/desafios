-- primality test for lambda study group 
--
-- Admitting that every prime is in the form 6k+-1,
-- that every number is a multiplication of primes, and
-- that a number can't be composed by primes bigger than
-- its square root, this algorithm is probably the one of
-- the simplest ways of doing primality tests.
--
-- its my first program in haskell, pardon me for the mess
-- author: v0idpwn 

int_sqrt :: Int -> Int
int_sqrt x = floor . sqrt . fromIntegral $ x

multipliers = [2,3] ++ [y | k <- [1..], y <- [(6*k)-1, (6*k)+1]]

used :: Int -> [Int]
used n = takeWhile(<= int_sqrt n) multipliers

check_div :: Int -> Int -> Bool
check_div k p
  | mod k p == 0 = True
  | otherwise = False

primality_test :: Int -> [Bool]
primality_test 1 = [True]
primality_test x = map (check_div x) (used x)  

check :: [Bool] -> Bool
check xs
  | or xs = False 
  | otherwise = True 

main = print (check (primality_test 104743))