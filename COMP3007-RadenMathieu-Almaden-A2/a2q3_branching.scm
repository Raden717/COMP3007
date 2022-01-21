#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 2 Question 3
|#

(#%require test-engine/racket-tests)

#|
Purpose: Run a mathematical function recursively
Input: number n -> number to be used in the function
Output: number -> value of the function
|#
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
      )
  )

#| Substitution model (recursive process)
(f 5)
(+ (f (- 5 1)) (* 2 (f (- 5 2))) (* 3 (f (- 5 3))))
(+ (f 4) (* 2 (f 3)) (* 3 (f 2)))
(+ (+ (f (- 4 1)) (* 2 (f (- 4 2))) (* 3 (f (- 4 3)))) (* 2 (+ (f (- 3 1)) (* 2 (f (- 3 2))) (* 3 (f (- 3 3))))) (* 3 2))
(+ (+ (f 3) (* 2 (f 2)) (* 3 (f 1))) (* 2 (+ (f 2) (* 2 (f 1)) (* 3 (f 0)))) 6)
(+ (+ (+ (f (- 3 1)) (* 2 (f (- 3 2))) (* 3 (f (- 3 3)))) (* 2 2) (* 3 1)) (* 2 (+ 2 (* 2 1) (* 3 0))) 6)
(+ (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) 4 3) (* 2 (+ 2 2 0)) 6)
(+ (+ (+ 2 (* 2 1) (* 3 0)) 4 3) (* 2 4) 6)
(+ (+ (+ 2 2 0) 4 3) 8 6)
(+ (+ 4 4 3) 8 6)
(+ 11 8 6)
25

|#

#|
Purpose: Run a mathematical function iteratively, with the helper function inside which uses tail recursion to do calculatins in a constant matter
Input: number n -> number to be used in the function
Output: number -> value of the function
|#
(define (fi n)
  (define (f-iter a b c counter)
    (if (< counter 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- counter 1))))
  (f-iter 2 1 0 n))



#| Substitution model (iterative process)
(fi 5)
(f-iter 2 1 0 5)
(f-iter (+ 2 (* 2 1) (* 3 0)) 2 1 (- 5 1))
(f-iter (+ 2 2 0) 2 1 4)
(f-iter 4 2 1 4)
(f-iter (+ 4 (* 2 2) (* 3 1)) 4 2 (- 4 1))
(f-iter (+ 4 4 3) 4 2 3)
(f-iter 11 4 2 3)
(f-iter (+ 11 (* 2 4) (* 3 2)) 11 4 (- 3 1))
(f-iter (+ 11 8 6) 11 4 (- 3 1))
(f-iter 25 11 4 2)
25

|#


