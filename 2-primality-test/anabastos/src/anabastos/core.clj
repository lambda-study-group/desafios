(ns anabastos.core)

(defn not-divisible? [n, m] (not= (mod n m) 0))

(defn max-divisor [n] (+ (int (Math/sqrt n)) 1))

(defn check-divisors [n] (every? (#(partial not-divisible? %) n) (range 2 (max-divisor n))))

(defn prime?
  "Returns if it's a prime number or not"
  [n]
  (cond
    (= n 0) false
    (= n 1) false
    :else (check-divisors n)
  ))