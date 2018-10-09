
reverseNumber :: Integer -> Integer
reverseNumber x =
    let core xs pos acc
            | null xs = acc
            | otherwise = 
                core (tail xs) (pos + 1) (10^pos * head xs + acc)
    in
        core (digs x) 0 0 


digs :: Integer -> [Integer]
digs 0 = []
digs x =
    digs (x `div` 10) ++ [x `mod` 10]


main = do
    input <- getLine
    let number = read input :: Integer
    print $ reverseNumber number