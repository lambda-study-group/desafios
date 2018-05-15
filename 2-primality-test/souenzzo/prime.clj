#!/usr/bin/env clojure

(defonce primes
  (atom (sorted-set 2 3)))

(defn new-prime
  [primes]
  (loop [possible-next (+ (last primes) 2)]
    (let [divs (filter #(zero? (mod possible-next %)) primes)]
      (if (empty? divs)
        (conj primes possible-next)
        (recur (+ 2 possible-next))))))

(defn prime?
  [n]
  (loop [prs @primes]
    (if (< n (last prs))
      (contains? prs n)
      (recur (swap! primes new-prime)))))

(let [my-primes (map bigint *command-line-args*)]
  (prn (time (reduce #(assoc %1 %2 (prime? %2)) {} my-primes))))

