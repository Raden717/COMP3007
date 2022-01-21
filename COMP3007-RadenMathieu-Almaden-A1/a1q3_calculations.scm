#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 1 Question 3
|#

;Question 3 a)


#|
Purpose: Round a number to a decimal point given by the user
Input: Number -> number to round, Integer -> decimal point to round to
Output: Number -> the rounded number
|#

(define (standard-roundf x y)
  (/ (floor (+ (* x (expt 10 y) ) 0.5) ) (expt 10 y)) ) ;Made the decimal a whole number to the decimal place it needs to be, added 0.5 then floored to make sure it rounds up properly. Ex  (standard-roundf 1.2224 3) -> 1222.4+.5 = 1222.9->1222->1.222

#|
Test Cases

Testing if round half to even still applies
2.1445 3 -> 2.145
1.2225 3 -> 1.222
2.5 0 -> 3.0
51.12465 4 -> 51.1247

Regular Testing
1.12415 2 -> 1.12
125125.2131616 5-> 125125.21316
1.99945 4 -> 1.9995
7.1231783 0 -> 7
7.4999999 0 -> 7

(standard-roundf
|#


;Question 3 b)
#|
Need to check all these conditions to before calculating with the triangle area formula

a + b > c
a + c > b
b + c > a

|#

#|
Purpose: Calculate the area of a triangle (if the triangle exists) based off 3 values given by user
Input: Number -> one side of triangle, Number -> one side of triangle, Number -> one side of triangle
Output: Number -> the area of the triangle (if exists)
|#
(define (area-triangle a b c)
  (define S  (/ (+ a b c) 2)) ;S value to be used in formula for the area of the triangle
    (if (> (+ a b) c) ;Checks condition 1
      (if (> (+ a c) b) ;Checks condition 2
          (if (> (+ b c) a) ;Checks condition 3
              (standard-roundf (sqrt (* S (- S a) (- S b) (- S c))) 3) ;If all conditions pass, calculates the area
              0)
          0)
      0))

#|

Test Cases

|#

(area-triangle 3 3 5) ;Checking if placement matters in the formula
(area-triangle 5 3 3) ;Should print non zero
(area-triangle 3 5 3) ;Should print non zero
(area-triangle 2 6 1) ;Shouldn't Print
(area-triangle -2 1 7) ;Negatives should print 0
(area-triangle 2 2 2) ;Checking the equaliteral triangles (should print) 
(area-triangle 3 7 8) ;Proper Triangle should print
(area-triangle 7 10 5) ;Proper triangle should print
(area-triangle 7 1 4) ;Shouldn't Print
(area-triangle 123 6632 716) ;Shouldn't Print
(area-triangle -3 -7 -1) ;Shouldn't Print
(area-triangle 512 6 21) ;Shouldn't Print
 
