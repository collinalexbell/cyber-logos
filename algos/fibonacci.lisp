
(defun fibonacci (n)
  (if (< n 2)
      n
      (+ (fibonacci (- n 1))
         (fibonacci (- n 2)))))


;; look at the crazy recursion tree
(trace fibonacci)
