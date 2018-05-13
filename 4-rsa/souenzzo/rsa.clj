#!/usr/bin/env clojure

(let [[e n & cry-msg] (map biginteger *command-line-args*)
      cry-chars (map (fn [i]
                       [(.modPow (biginteger (- i 87)) e n) (char i)])
                     (range (int \a) (int \z)))]
  (->> (for [cry-char cry-msg]
         (-> (comp not #{cry-char} first)
             (drop-while cry-chars)
             first
             second))
       (apply str)
       println))

