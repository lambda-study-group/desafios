#!/usr/bin/env clojure

(def ^:dynamic *base* 10N)

(defn pow
  [n]
  (if (zero? (dec n)) n (* *base* (pow (dec n)))))

(defn init
  [n]
  (bigint (/ n *base*)))

(defn len
  [n]
  (if (zero? n) n (inc (len (init n)))))

(defn tail
 [n]
 (mod n (pow (len n))))

(defn head
 [n]
 (bigint (/ n (pow (len n)))))

(defn rev
  [n]
  (if (zero? n) n (+ (head n) (* *base* (rev (tail n))))))

(let [ns (map bigint *command-line-args*)]
  (prn (time (reduce #(assoc %1 %2 (rev %2)) {} ns))))
