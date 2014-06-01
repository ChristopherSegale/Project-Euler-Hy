;;;; Author: Christopher Segale
;;;; Date: 05/31/2014

(import [math [sqrt]])

(defn isqrt [n]
  (int (sqrt n)))

(defn is-zero [n]
  (= n 0))

(defn oddp [n]
  (not (is-zero n)))

(defn modulop [n m]
  (is-zero (% n m)))

(defn prune-mod [l n]
  (list-comp x [x l] (or (= x n) (not (modulop x n)))))

;;; uses sieve of Eratosthenes
(defn gen-primes [n]
  (cond
    [(>= 1 n)
      []]
    [(= 2 n)
      [2]]
    [true
      (do
        (let [[primes (prune-mod (range 2 n) 2)]
              [limit (isqrt n)]]
          (for [i (range 3 limit)]
            (setv primes (prune-mod primes i)))
          primes))]))

;;; Takes too long to execute
(defn problem003 []
  (.pop (gen-primes 600851475143)))

(defn main []
  (print (problem003)))

(main)
