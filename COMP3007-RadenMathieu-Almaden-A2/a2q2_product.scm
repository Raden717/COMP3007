#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 2 Question 2
|#

(#%require test-engine/racket-tests)

;Question 2 a)

#|
Purpose: To find the product of all values from a to b recursively
Input: Number a -> starting value , Number b -> final value , term -> procedure to apply on current product, next -> procedure on how to iterate through the values
Output: Number -> the product
|#
(define (product a b term next)
    (if (> a b)
        1
        (* (term a)
           (product (next a) b term next))))


;Question 2 b)

#|
Purpose: To find the product of all values from a to b iteratively
Input: Number a -> starting value , Number b -> final value , term -> procedure to apply on current product, next -> procedure on how to iterate through the values
Output: Number -> the product
|#
(define (product-it a b term next)
  (define (product-iteration counter total)
    (if (> counter b)
        total
        (product-iteration (next counter) (* total (term counter)))))
  (product-iteration a 1) )

;Question 3 c)

(define (square x)
  (* x x)
  )

(define (cube x)
  (* x x x)
  )

;Question 3 c) i)
(display "Question 3 c)")
(newline)
(display (product 1 30 (lambda(x)(+ (- (square x) (* 3 x)) 7))(lambda(x)(+ x 1))) )
(newline)

;Question 3 b) ii)
(display (product 0 10 (lambda(x)(cube (+ (* 2 x) 1)))(lambda(x)(+ x 1))) )
(newline)
;Question 3 b) iii)
(display (product 3 8 (lambda(x)(product x 5 (lambda(y)(* 4 x y))(lambda(y)(+ y 1))))(lambda(x)(+ x 1))))


(newline)
(newline)
(display "TESTING")
(newline)
;Testing product recursively
(check-expect (product 1 5 (lambda(x)x)(lambda(x)(+ x 1)))  120)
(check-expect (product 5 10 (lambda(x)x)(lambda(x)(+ x 1)))  151200)
(check-expect (product 0 10 (lambda(x)x)(lambda(x)(+ x 1)))  0) ;Edge case starting at 0
(check-expect (product 10 10 (lambda(x)x)(lambda(x)(+ x 1)))  10) ;Edge case only at 0
(check-expect (product 1 10 (lambda(x)x)(lambda(x)(+ x 1)))  3628800) 

;Testing with a function (3x)
(check-expect (product 1 5 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  29160)
(check-expect (product 5 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  110224800)
(check-expect (product 0 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  0) ;Edge case starting at 0
(check-expect (product 10 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  30) ;Edge case only at 0
(check-expect (product 1 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  214277011200)

;Testing product iteratively
(check-expect (product-it 1 5 (lambda(x)x)(lambda(x)(+ x 1)))  120)
(check-expect (product-it 5 10 (lambda(x)x)(lambda(x)(+ x 1)))  151200)
(check-expect (product-it 0 10 (lambda(x)x)(lambda(x)(+ x 1)))  0) ;Edge case starting at 0
(check-expect (product-it 10 10 (lambda(x)x)(lambda(x)(+ x 1)))  10) ;Edge case only at 0
(check-expect (product-it 1 10 (lambda(x)x)(lambda(x)(+ x 1)))  3628800) 

;Testing with a function (3x)
(check-expect (product-it 1 5 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  29160)
(check-expect (product-it 5 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  110224800)
(check-expect (product-it 0 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  0) ;Edge case starting at 0
(check-expect (product-it 10 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  30) ;Edge case only at 0
(check-expect (product-it 1 10 (lambda(x)(* 3 x))(lambda(x)(+ x 1)))  214277011200)

(test)
