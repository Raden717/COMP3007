#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 3 Question 2
|#


; This function takes in a list, then iterates through the list checking every value for if it's a list
; if the element is a list, it appends the values of that list to the list and passes back in the
; appended list. And while checking if its in integer, it adds to the sum of the list value and to the number of integers within
(define (mean L)

  (define (nextElem remainingList curSum curInts)
       (if (null? remainingList)
           (/ curSum curInts)
           (if (list? (car remainingList))
               (makeList (car remainingList) (cdr remainingList) curSum curInts)
               (if (integer? (car remainingList))
                   (nextElem (cdr remainingList) (+ curSum (car remainingList)) (+ curInts 1))
                   (nextElem (cdr remainingList) curSum curInts)
               ))))
  
  (define (makeList insideList outsideList curSum curInts)
    (if (null? insideList)
        (nextElem outsideList theMax)
        (makeList (cdr insideList) (append insideList outsideList) curSum curInts)
    ))
    
     (nextElem L 0 0)
  )

;Testing
(display "TESTING a) ~~~~~~~~~~~~~~~~")
(newline)

(display "(mean '(1 2 3 4 5)) expected: 3 actual: ")
(mean '(1 2 3 4 5))

(display "(mean '(1 2 3 s 4 d 8 d g z a 5 s)) expected: 3 5/6 actual: ")
(mean '(1 2 3 s 4 d 8 d g z a 5 s))

(display "(mean '(1 2 3 4 5 32 1 763 21 s 73 61)) expected: 87 9/11 actual: ")
(mean '(1 2 3 4 5 32 1 763 21 s 73 61))

(newline)


;b

;Helper function to remove items from the end of list
(define (remove-last lst)
    (if (null? (cdr lst))
        '()
        (cons (car lst) (remove-last (cdr lst)))))

;Helper Function to find the length of the list
(define (length lst)
  (cond ((null? lst) 0)
        (else (+ 1 (length (cdr lst))))))


(define (slice L start finish)

  (define (iter L start finish max)
    (if (not (null? L))
      (if (< start 1)
          (if (< max finish)
              L
              (iter (remove-last L) start finish (- max 1))
              )
          (iter (cdr L) (- start 1) finish max))
          '())

      )
    

  (iter L start finish (- (length L) 1))
  )

(display "TESTING b) ~~~~~~~~~~~~~~~~")
(newline)

(display "(slice '(0 1 2 3 4 5 6 7 8 9) 3 8) expected:(3 4 5 6 7) actual: ")
(slice '(0 1 2 3 4 5 6 7 8 9) 3 8)

(display "(slice '(0 1 2 3 4 5 6 7 8 9) 5 25) expected: (5 6 7 8 9) actual: ")
(slice '(0 1 2 3 4 5 6 7 8 9) 5 25)

(display "(slice '(0 1 2 3 4 5) -10 3) expected: (0 1 2) actual: ")
(slice '(0 1 2 3 4 5) -10 3)

(newline)


;c ??




;d Helper Function to find largest item in list
(define (max L)

  (define (nextElem remainingList curMax)
       (if (null? remainingList)
           curMax
           (if (list? (car remainingList))
               (makeList (car remainingList) (cdr remainingList) curMax)
               (if (> (car remainingList) curMax)
                   (nextElem (cdr remainingList) (car remainingList))
                   (nextElem (cdr remainingList) curMax)
               ))))
  
  (define (makeList insideList outsideList theMax)
    (if (null? insideList)
        (nextElem outsideList theMax)
        (makeList (cdr insideList) (append insideList outsideList) theMax)
    ))
    
     (nextElem L (car L))
  )


(define (tails L)

  ;Moves to the position in list with the largest value
  (define (iterateTo newList max)
     (if (= (car newList) max)
         (cdr newList)
         (iterateTo (cdr newList) max)))

  (define (makeL Li remList)
    (if (not (null? remList))
        (cons (iterateTo remList (max remList)) (makeL Li (iterateTo remList (max remList))))
        '()))
        
  (makeL (list) L)
  )

(display "TESTING d) ~~~~~~~~~~~~~~~~")
(newline)

(display "(tails '(4 2 8 7 8 1 2))   expected: ((7 8 1 2) (1 2) ())   actual: ")
(tails '(4 2 8 7 8 1 2))

(display "(tails '(3 6 8 9 7 4 8 6 3))   expected: ((7 4 8 6 3) (6 3) (3) ())   actual: ")
(tails '(3 6 8 9 7 4 8 6 3))

(display "(tails '(421 412 63 522 32 1 6))   expected: ((32 1 6) (1 6) ())   actual: ")
(tails '(421 412 63 522 32 1 6))

(display "(tails '(5 23 7 3 1 3 62 41 412))   expected: (())   actual: ")
(tails '(5 23 7 3 1 3 62 41 412))



