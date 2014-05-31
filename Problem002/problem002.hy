;;;; Author: Christopher Segale
;;;; Date: 05/31/2014

(defn is-zero [n]
  (= n 0))

(defn evenp [n]
  (is-zero (% n 2)))

(defn gen-fibs [limit]
  (let ((fibs [1 2]))
    (cond [(> 0 limit)
            false]
          [(= limit 1)
            [0]]
          [(= limit 2)
            [(car fibs)]]
          [(> limit 2)
            (do 
              (let [[first-term (car fibs)]
                    [second-term (-> fibs (cdr) (car))]
                    [third-term 0]]
                (while (< third-term limit)
                  (setv third-term (+ first-term second-term))
                  (.append fibs third-term)
                  (setv first-term second-term)
                  (setv second-term third-term)))
	    (.pop fibs)
            fibs)])))

(defn main []
  (let [[fibs (gen-fibs 4000000)]]
    (print (sum (list-comp n [n fibs] (evenp n))))))

(main)
