#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 2 Question 4
|#

(#%require test-engine/racket-tests)

#|
Purpose: To find out how many bars of chocolate one can afford
Input: Integer wall -> how much money you have, Integer price -> how much the bar costs, Integer wrapper -> how many wrappers of bars of chocalates needed for a free bar
Output: Integer -> total bars of chocolate you can get
|#
(define (bars wall price wrapper)

  ;Helper function that calculates how much bars you can obtain with just money
  (define (barsPAID x y)
    (floor (/ x y))
    )

  ;Helper function that calculates how much bars you can get for free ontop of how bars you can initially afford
  (define (barsFREE z paidforBARS totalbars)
        (if (< (- paidforBARS z) 0)
            totalbars
            (barsFREE z (+ (- paidforBARS z) 1) (+ totalbars 1) )
            )
                      
        )

  ;Final function call to find the total number of bars you can obtain
  (barsFREE wrapper (barsPAID wall price) (barsPAID wall price)) 

  )

(check-expect (bars 10 3 3) 4)
(check-expect (bars 3 3 3) 1)
(check-expect (bars 0 3 3) 0) ;Edge case 0 money
(check-expect (bars 15 3 3) 7)
(check-expect (bars 25 3 3) 11)
(check-expect (bars 32141 421 15) 81) ;Testing larger values
(check-expect (bars 421 421 15) 1) ;Testing edge case for larger values if wallet = price
(check-expect (bars 5216 1 15) 5588) ;Testing large values of free bars
(check-expect (bars 1233 1 2) 2465)
(check-expect (bars 121 1 3) 181)



(test)
