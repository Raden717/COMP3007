#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 2 Question 1
|#

(#%require test-engine/racket-tests)

;Question 1 a)

#|
Purpose: To square the number input
Input: Number -> Number to be squared (Our guess for our root algorithm)
Output: Number -> the number input squared 
|#
(define (square y)
  (* y y) )

#|
Purpose: To cube the number input
Input: Number -> Number to be cubed
Output: Number -> the number input cube 
|#
(define (cube y)
  (* (square y) y))

#|
Purpose: To divide the cube root value with our guess that was squared
Input: Number x -> number that we are trying to cube root, Number y -> our guess that will be squared then divided into x
Output: Number -> The quotient of the two inputs
|#
(define (quotient x y)
  (/ x (square y)
     )
  )

#|
Purpose: To find the average of the quotient and another value to get an approximate guess
Input: Number x -> number that we are trying to cube root, Number y -> our guess of the cube rooted value
Output: Number -> a more approximate guess than our value of y
|#
(define (average x y)
  (/ (+ (quotient x y)
        (* 2 y)
     )
     3)
  )


#|This function was taken from http://people.scs.carleton.ca/~arunka/courses/comp3007/lectures/03-Procedures/307Notes3.html and was slightly modified
Purpose: To limit our guessing to a certain decimal
Input: Number guess -> our guess of the cube root, x -> the value we are trying to cube root
Output: Boolean -> true,false of whether or not we should keep guessing 
|#
(define (good-enough? guess x)
    (< (abs (- (cube guess) x)) 0.001))

#|
Purpose: To further improve our approximated value of the cube root of the value we're guessing
Input: Number guess -> our guess of the cube rooted value , Number x -> our value that we are cube rooting
Output: Number -> A value that is closer to the actual cube root 
|#
(define (improve x guess)
    (average x (average x guess)))

#|This function was taken from http://people.scs.carleton.ca/~arunka/courses/comp3007/lectures/03-Procedures/307Notes3.html and was slightly modified
Purpose: Recursive function until a certain guess is good enough for the cube root
Input: Number guess -> Our/New guess of the cube rooted value , Number x -> our value that we are cube rooting
Output: Number -> Most approximate guess based off our good enough function
|#
(define (cbrt-iteration guess x)
    (if (good-enough? guess x)
        guess
        (cbrt-iteration (improve x guess) x)))

#|
Purpose: To cube root a value approximately
Input: Number x -> value we are trying to cube root, function -> our function to check if it's good enough
Output: Number -> Approximation of the value
|#

(define (cube-root x)
    (cbrt-iteration 1.0 x)
  )

;TESTING
;TESTING WHOLE VALUES
(display "TESTING CUBE ROOT QUESTION 1a)")
(newline)
(display (cube-root 27))
(display " Should be about 3")
(newline)
(display (cube-root 64))
(display " Should be about 4")
(newline)
(display (cube-root 125))
(display " Should be about 5")
(newline)
(display (cube-root 1000))
(display " Should be about 10")
(newline)
;TESTING not as clear values
(display (cube-root 125.4215))
(display " Should be about 5.0056137")
(newline)
(display (cube-root 52161.21))
(display " Should be about 37.3636435")
(newline)
(display (cube-root 124161))
(display " Should be about 49.8878821")
(newline)
(display (cube-root 1743.125))
(display " Should be about 12.0349099")
(newline)
(newline)
(newline)





; ~~~~BREAK~~~~~

;Question 1 b)


#|This function was taken from http://people.scs.carleton.ca/~arunka/courses/comp3007/lectures/03-Procedures/307Notes3.html and was slightly modified
Purpose: Recursive function until a certain guess is good enough for the cube root based off a good enough function that is given
Input: Number guess -> Our/New guess of the cube rooted value , Number x -> our value that we are cube rooting, function -> a function that determines our good enough approximate
Output: Number -> Most approximate guess based off our good enough function
|#
(define (cbrt-iteration2 guess x function)
    (if (function guess x)
        guess
        (cbrt-iteration2 (improve x guess) x function)))

#|
Purpose: To cube root approximately with a personal input of a good enough function
Input: Number x -> value we are trying to cube root, function -> our function to check if it's good enough
Output: Number -> Approximation of the value
|#
(define (cube-root2 x function)
    (cbrt-iteration2 1.0 x function)
  )

(define (good-enough?0.1 guess x)
    (< (abs (- (cube guess) x)) 0.1))

(define (good-enough?0.01 guess x)
    (< (abs (- (cube guess) x)) 0.01))

(define (good-enough?0.00001 guess x)
    (< (abs (- (cube guess) x)) 0.00001))


;TESTING
;TESTING WHOLE VALUES
(display "TESTING CUBE ROOT QUESTION 1b) with 0.1 good enough function")
(newline)
(display (cube-root2 27 good-enough?0.1))
(display " Should be about 3")
(newline)
(display (cube-root2 64 good-enough?0.1))
(display " Should be about 4")
(newline)
(display (cube-root2 125 good-enough?0.1))
(display " Should be about 5")
(newline)
(display (cube-root2 1000 good-enough?0.1))
(display " Should be about 10")
(newline)
;TESTING not as clear values
(display (cube-root2 125.4215 good-enough?0.1))
(display " Should be about 5.0056137")
(newline)
(display (cube-root2 52161.21 good-enough?0.1))
(display " Should be about 37.3636435")
(newline)
(display (cube-root2 124161 good-enough?0.1))
(display " Should be about 49.8878821")
(newline)
(display (cube-root2 1743.125 good-enough?0.1))
(display " Should be about 12.0349099")
(newline)
(newline)
(newline)

;TESTING
;TESTING WHOLE VALUES
(display "TESTING CUBE ROOT QUESTION 1b) with 0.01 good enough function")
(newline)
(display (cube-root2 27 good-enough?0.01))
(display " Should be about 3")
(newline)
(display (cube-root2 64 good-enough?0.01))
(display " Should be about 4")
(newline)
(display (cube-root2 125 good-enough?0.01))
(display " Should be about 5")
(newline)
(display (cube-root2 1000 good-enough?0.01))
(display " Should be about 10")
(newline)
;TESTING not as clear values
(display (cube-root2 125.4215 good-enough?0.01))
(display " Should be about 5.0056137")
(newline)
(display (cube-root2 52161.21 good-enough?0.01))
(display " Should be about 37.3636435")
(newline)
(display (cube-root2 124161 good-enough?0.01))
(display " Should be about 49.8878821")
(newline)
(display (cube-root2 1743.125 good-enough?0.01))
(display " Should be about 12.0349099")
(newline)
(newline)
(newline)

;TESTING
;TESTING WHOLE VALUES
(display "TESTING CUBE ROOT QUESTION 1b) with 0.00001 good enough function")
(newline)
(display (cube-root2 27 good-enough?0.00001))
(display " Should be about 3")
(newline)
(display (cube-root2 64 good-enough?0.00001))
(display " Should be about 4")
(newline)
(display (cube-root2 125 good-enough?0.00001))
(display " Should be about 5")
(newline)
(display (cube-root2 1000 good-enough?0.00001))
(display " Should be about 10")
(newline)
;TESTING not as clear values
(display (cube-root2 125.4215 good-enough?0.00001))
(display " Should be about 5.0056137")
(newline)
(display (cube-root2 52161.21 good-enough?0.00001))
(display " Should be about 37.3636435")
(newline)
(display (cube-root2 124161 good-enough?0.00001))
(display " Should be about 49.8878821")
(newline)
(display (cube-root2 1743.125 good-enough?0.00001))
(display " Should be about 12.0349099")
(newline)
(newline)
(newline)


; ~~~~~~BREAK~~~~~

;Question 1 c)


;These are functions for testing
(define (new-if predicate consequent alternate)
        (cond (predicate consequent)
              (else alternate)))

(define (cbrt-iteration3 guess x)
    (new-if (good-enough? guess x)
        guess
        (cbrt-iteration3 (improve x guess) x)))


(define (cube-root3 x)
    (cbrt-iteration3 1.0 x)
  )

#| Question 1 c) Answer and explanation
In this new version of cube-root3, this will not work due to how conditionals within this new function. What ends up happening in the new-if function is that the else condition will always end up being evaluated.
This is because it's trying to run the possible outcomes first before actually checking if they ever reach those outcomes. Since one of the outcomes is recursive, it repeats itself endlessly. This function however will work
if the else statement is not a recursive function to itself.
An easy test to show this is that you can write
(new-if #t 1 (cbrt-iteration3 (improve 1 1) 1) ) and this shouldn't ever reach cbrt-iteration3 but with the new-if function, it still tries to run the recursive function which then causes it to continuosly run itself since the recursive function contains something similar.
|#