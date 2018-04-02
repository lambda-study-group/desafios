(ns anabastos.core-test
  (:require [clojure.test :refer :all]
            [anabastos.core :refer :all]))

(deftest a-test
  (testing "Primality"
    (is (= (prime? 0) false))
    (is (= (prime? 1) false))
    (is (= (prime? 2) true))
    (is (= (prime? 3) true))
    (is (= (prime? 79) true))
    (is (= (prime? 1471) true))
    (is (= (prime? 561) false))
    (is (= (prime? 104742) false))
    (is (= (prime? 104743) true))
    ))
