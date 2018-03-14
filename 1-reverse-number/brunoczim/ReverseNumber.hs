module ReverseNumber (reverseDec) where


reverseDec :: (Integral a) => a -> a
reverseDec n = if n < 0
  then -res
  else res
  where
    res = _reverseDec (abs n) 0
    _reverseDec 0 acc = acc
    _reverseDec n acc = _reverseDec newN newAcc where
      newAcc = acc * 10 + (n `rem` 10)
      newN = n `div` 10
