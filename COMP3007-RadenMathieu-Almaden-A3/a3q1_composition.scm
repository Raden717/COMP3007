#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 3 Question 1
|#


;a)
(define (compose f g)
  (lambda (x)
    (f (g x))))


(define square (lambda(x)(* x x)))
(define double (lambda(x)(+ x x)))


;b
(define (endswith n)
  (lambda (x)
    (= (remainder x 10) n)
  )
 )


;c
(define (newmap f)
  (lambda (L)
    (if (null? L)
        '()
        (cons (f (car L)) ((newmap f) (cdr L)))
        )
    )
  )

;d
(define (newfilter keep? f)
  (lambda (L)
    (if (null? L)
        '()
        (if (equal? keep? (f (car L))) (cons (car L) ((newfilter keep? f) (cdr L))) ((newfilter keep? f) (cdr L)))
       
        )
    )
  )

;e

(define (range a b)
    (if (= a b) (list a)
        (cons a (range (+ a 1) b))))

(define (myfunc r)
  ((compose (newmap (lambda(x)(* x 3))) (newfilter #f (endswith 0))) r)
  )



  
  