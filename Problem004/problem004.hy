;;;; Author: Christopher Segale
;;;; Date: 06/01/2014

(import [math [pow]])

(defmacro modv [op n m]
  `(setv ~n (~op ~n ~m)))

(defmacro decf [n]
  `(modv - ~n 1))

(defn reverse-num [n]
  (let [[rest n]
        [divisor 0]
        [reverse 0]
        [exponent (- (len (str n)) 1)]]
    (while (> rest 1)
      (setv divisor (int (% rest 10)))
      (modv + reverse (* divisor (pow 10 exponent)))
      (decf exponent)
      (modv / rest 10))
    (int reverse)))

(defn palindrome-nump [n]
  (= n (reverse-num n)))

(defn problem004 []
  (let [[palindrome 0]
        [product 0]]
    (for [i (range 100 1000)]
      (for [j (range 100 1000)]
        (setv product (* i j))
        (if (and (palindrome-nump product) (< palindrome product))
          (setv palindrome product))))
    palindrome))

(defn main []
  (print (problem004)))

(main)
