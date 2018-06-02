#!/usr/bin/clojure

(ns lambda01
(:use [clojure.core] :reload))

(defn rev-int [args]
  (map
    #(apply str (reverse (str (bigint %))))
    args)
)
(prn (rev-int *command-line-args*))
