#!/bin/clj

(defn pow [n base] 
  (apply * (repeat base n)))

(defn test-prime [n] 
  (if (or (= 1N (mod (pow 2N (- n 1N)) n)) (= n 2))
  true
  false
  )
)

(prn (map test-prime (map bigint *command-line-args*)))
