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

(defn factor2
  [n]
  (if (prime? n)
    false
    (let [prs (take-while (partial >= (/ n 2)) @primes)]
      (first (for [q prs
                   p prs
                   :when (= (* p q) n)]
               [p q])))))

(defn phi
  [p q]
  (* (dec p) (dec q)))


(defn list-privates
  [e phi]
  (for [k (range)
        :let [d (/ (inc (* k phi)) e)]
        :when (and (integer? d)
                   (prime? d))]
    d))

(defn find-private
  [e n]
  (let [[p q] (factor2 n)
        my-phi (phi p q)]
    {:p p :q q :e e :n n
     :d (biginteger (first (list-privates e my-phi)))}))

(defmulti decrypt first)
(defmethod decrypt :default
  [[dispatch]]
  {:current dispatch :availble (remove #{:default} (keys (methods decrypt)))})

(defmethod decrypt "--brute-force"
  [args]
  (let [[e n & cry-msg] (map biginteger (rest args))
        cry-chars (for [i (range (int \a) (int \z))]
                    [(.modPow (biginteger (- i 87)) e n) (char i)])]
    (->> (for [cry-char cry-msg]
           (-> (comp not #{cry-char} first)
               (drop-while cry-chars)
               first
               second))
         (apply str)
         (assoc {:e e :n n} :msg))))


(defmethod decrypt "--find-private"
  [args]
  (let [[e n & cry-msg] (map biginteger (rest args))
        {:keys [d]
         :as   key} (find-private e n)]
    (->> (for [^BigInteger cry-char cry-msg]
           (char (+ 87 (.modPow cry-char d n))))
         (apply str)
         (assoc key :msg))))

(defmethod decrypt "--list-privates"
  [args]
  (let [[e n a] (map biginteger (rest args))
        [p q] (factor2 n)
        my-phi (phi p q)]
    {:e e :n n :p p :q q :phi my-phi :ds (take a (list-privates e my-phi))}))


(prn (time (decrypt *command-line-args*)))

