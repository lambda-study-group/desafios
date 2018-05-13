#!/usr/bin/env clojure

(let [n (biginteger 21181)
      e (biginteger 11)
      cry-msg [15706 8628 13264 21022 18699 8628]
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

