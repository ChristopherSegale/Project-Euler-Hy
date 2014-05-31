;;;; Author: Christopher Segale
;;;; Date: 05/31/2014

(defn is-zero [n]
  (= n 0))

(defn modulop [n m]
  (is-zero (% n m)))

(defn sum-multiples [m1 m2 limit]
  (let [[sum 0]]
    (for (i (range limit))
      (if (or (modulop i m1) (modulop i m2))
        (setv sum (+ sum i))))
    sum))

(defn main []
  (print (sum-multiples 3 5 1000)))

(main)
