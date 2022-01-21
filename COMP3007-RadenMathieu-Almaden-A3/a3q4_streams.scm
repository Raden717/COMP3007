#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 3 Question 4
|#

;a

; Helper functions
(define-syntax stream-cons
    (syntax-rules ()
        ((stream-cons a b)(cons a (delay b)))))

(define (stream-car stream) 
    (car stream))
		
(define (stream-cdr stream)
    (force (cdr stream)))

; Takes list and outputs the stream of the list
(define (list->stream L)
  (if (null? L) '()
      (if (null? (car L))
          '()
          (stream-cons (car L) (list->stream (cdr L)))))
  )

(display "TESTING a) ~~~~~~~~~~~~~~~~")
(newline)

(display "(list->stream '(5 4 3 2 1 0))   expected: (5 . #<promise>)   actual: ")
(list->stream '(5 4 3 2 1 0))
(newline)

(display "(list->stream '(5125 321 62 4 1 0))   expected: (5125 . #<promise>)   actual: ")
(list->stream '(5125 321 62 4 1 0))
(newline)

(display "(list->stream '(11 8 5 3 2 0))   expected: (11 . #<promise>)   actual: ")
(list->stream '(11 8 5 3 2 0))
(newline)


;b)
; Iterates through the stream in for n times and ends up calling car for each position, with the exception that
; if N is larger than then it ends up at the end of the stream
(define (stream->list stream n)
  (if (null? stream)
      '()
      (if (> n 0)
          (cons (stream-car stream) (stream->list (stream-cdr stream) (- n 1)))
          '())))

(display "(stream->list (list->stream '(3 2 1)) 70)   expected: (3 2 1)   actual: ")
(stream->list (list->stream '(3 2 1)) 70)

(newline)
(display "(stream->list (list->stream '(5 4 3 2 1 0)) 2)   expected: (5 4)   actual: ")
(stream->list (list->stream '(5 4 3 2 1 0)) 2)

(newline)(display "(stream->list (list->stream '(5 4 3 2 1 0)) 0)   expected: ()   actual: ")
(stream->list (list->stream '(5 4 3 2 1 0)) 0)


;c)
(newline)

; Helper function
(define (integerStream num s)
  (stream-cons num (integerStream (+ num s) s)))

; Using the helper function to create odds as the stream of the set of odd numbers
(define odds (integerStream 1 2))

; Tests
(display "TESTING c) ~~~~~~~~~~~~~~~~")
(newline)

(display "odd numbers starting at 1, -> expected: (1 . #<promise>)   actual: ")
odds
(newline)

(display "2nd odd number   expected: (3 . #<promise>)   actual: ")
(stream-cdr odds)
(newline)

(display "3rd odd number   expected: (5 . #<promise>)   actual: ")
(stream-cdr (stream-cdr odds))
(newline)

(display "4th odd number   expected: (7 . #<promise>)   actual: ")
(stream-cdr (stream-cdr (stream-cdr odds)))
(newline)

(display "5th odd number   expected: (9 . #<promise>)   actual: ")
(stream-cdr (stream-cdr (stream-cdr (stream-cdr odds))))
(newline)

;   d)

; Passes x into my helper function that will start at pos x and move up x position every iteration
(define (repeated x)
  (integerStream x x))

(display "TESTING d) ~~~~~~~~~~~~~~~~")
(newline)
(display "repeats of 5   expect 5, 10, 15... etc. expected: (5 . #<promise>)   actual: ")
(repeated 5)
(newline)

(display "(stream-cdr (repeated 5))   expected: (10 . #<promise>)   actual: ")
(stream-cdr (repeated 5))
(newline)

(display "Random Number Testing (1321)
         (repeated 1321)   expected: (1321 . #<promise>)   actual: ")
(repeated 1321)
(newline)

(display "Random Number Testing (1115)
         (repeated 1115)   expected: (1115 . #<promise>)   actual: ")
(repeated 1115)
(newline)




;   e)

; Procedures from lecture 5.4
(define (integers-starting-from n)
    (stream-cons n (integers-starting-from (+ n 1))))
		
(define integers (integers-starting-from 1))

; Procedure counting the number of elements in a stream before a predicate is true
(define (stream-until strm pred)

  (define (itr s p n)
    (if (not (null? s))
        (if (p (stream-car s))
            n
            (itr (stream-cdr s) p (+ 1 n)))
        -1)
    )

  (itr strm pred 0)
  )

; Tests
(display "TESTING e) ~~~~~~~~~~~~~~~~")
(newline)

(newline)(display "(stream-until integers (lambda(x)(= x 15)))   expected: 14   actual: ")
(stream-until integers (lambda(x)(= x 15)))

(newline)(display "(stream-until (repeated 7) (lambda(x)(> x 6)))   expected: 0   actual: ")
(stream-until (repeated 7) (lambda(x)(> x 6)))

(newline)(display "Testing conditions which is greater than the list, expecting -1:
         (stream-until (list->stream '(1 2 3)) (lambda(x)(= x 12451)))   expected: -1   actual: ")
(stream-until (list->stream '(1 2 3)) (lambda(x)(= x 12451)))



;   f)
(newline)(display "   f) ")

; Altered function to terminate list with a 0 if negative
(define (str->lis strm n)
  (if (null? strm)
      '()
      (if (> n 0)
          (cons (stream-car strm) (str->lis (stream-cdr strm) (- n 1)))
          (cons 0 '()))))

; Procedure which returns rounded stream
(define (loan amnt rate payment)
  (define pay
    (stream-cons amnt (loan (roundTo (+ (- amnt payment) (* amnt rate))) rate payment)))
  pay
  )

;Helper function to get the loan
(define (getLoan amount interest pay)
  (let ((num (stream-until (loan amount interest pay) (lambda(x)(not (> x 0))))))
    (let ((lis (str->lis (loan amount interest pay) num)))
      (list->stream lis)))
  )

; Function to round to 2 decimal places
(define (roundTo x)
  (/ (round (* 100 x)) 100))

(display "TESTING f) ~~~~~~~~~~~~~~~~")
(newline)
(display "Returns rounded stream of remaining balances per month:
         (loan 5000 0.1 1500)   expected: (5000 .#<promise>)   actual: ")(loan 5000 0.1 1500)

(newline)(display "Helper function returning the full list for the stream before 0:
            (stream-list (getLoan 5000 0.1 1500) 100)   expected: 5000 streaming towards 0
            actual: ")(stream->list (getLoan 5000 0.153 1500) 100)

(newline)(display "(stream->list (loan 10000 0.025 500) 5)   expected: (10000 9750.0 9493.75 9231.09375 8961.87109375)
            actual: ") (stream->list (loan 10000 0.025 500) 5)

(newline)(display "Using getLoan to returns the stream to make sure it goes to 0 instead of negative:
            (stream->list (getloan 20 0.003 10) 5)   expected: (20 10.06 0.09 0)
            actual: ")(stream->list (getloan 20 0.003 10) 5)