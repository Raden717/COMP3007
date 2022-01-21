#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 2 Question 5
|#
(#%require (only racket/base random))

;Question 5 a)

#|
Purpose: To create an abstraction for a random card
Input: No input
Output: No output
|#
(define (randomcard)

  (define randomnum (random 2 14))
  (define randomsuit (random 1 5))
  
  (let ((placeholder 0))
    (lambda (x)(if (= x 0)(cond
                            ((= randomsuit 1) "spades")
                            ((= randomsuit 2) "clubs")
                            ((= randomsuit 3) "hearts")
                            ((= randomsuit 4) "diamonds")
                            (else "what")
                            )
                   randomnum))))


#|
Purpose: To retrieve the suit from the randomcard abstraction
Input: randomcard -> the function we are getting the suit from 
Output: string-> the suit
|#
(define (thesuit r)
  (r 0)
  )

#|
Purpose: To retrieve the number value from the randomcard abstraction
Input: randomcard -> the function we are getting the suit from 
Output: string-> the value
|#
(define (thenum r)
  (r 1)
  )

;Some Testing
(define testcard (randomcard))
(thesuit testcard)
(thesuit testcard)
(thesuit testcard)
(thenum testcard)
(thenum testcard)
(thenum testcard)
(define testcard2 (randomcard))
(thesuit testcard2)
(thesuit testcard2)
(thesuit testcard2)
(thenum testcard2)
(thenum testcard2)
(thenum testcard2)
(define testcard3 (randomcard))
(thesuit testcard3)
(thesuit testcard3)
(thesuit testcard3)
(thenum testcard3)
(thenum testcard3)
(thenum testcard3)



;Question 5 b)

(define (displaycard x)

  (if (< 10 (thenum x))
      (cond
        ((= (thenum x) 11)(display "J"))
        ((= (thenum x) 12)(display "Q"))
        ((= (thenum x) 13)(display "K"))
        ((= (thenum x) 14)(display "A"))
        )
      (display (thenum x))
      )
  (display " of ")
  (display (thesuit x))
  
 )

(displaycard testcard)
(newline)
(displaycard testcard2)
(newline)
(displaycard testcard3)
(newline)


;Question 5c)

#| A little note, there is a ton of if statements because I can't put a new procedure within an if statement, or couldn't figure out how to
Purpose: To play a game
Input: no input
Output: no output
|#
(define (play-war)
  (define (score p1 p2 continue?)
    (define p1card (randomcard))
    (define p2card (randomcard))


    (if (= continue? 1)
        (display "P1 card is:")
        )
    (if (= continue? 1)
        (displaycard p1card)
        )
    (if (= continue? 1)
        (newline)
        )
    (if (= continue? 1)
        (display "P2 Card is :")
        )
    (if (= continue? 1)
        (displaycard p2card)
        )
    (if (= continue? 1)
        (newline)
        )
    (if (= continue? 1)
        (if (> (thenum p1card) (thenum p2card))
            (display "p1 wins this round")
            )
        )
    (if (= continue? 1)
        (if (< (thenum p1card) (thenum p2card))
            (display "p2 wins this round")
            )
    )
    (newline)
    (if (= continue? 1)
        (display "Would you like to play again?, 1 for yes, 0 for no: ")
        )
    
    
    
    (if (= continue? 1)
         (if (= (thenum p1card) (thenum p2card))
             (score p1 p2 1)
             (if (> (thenum p1card) (thenum p2card))
                   (if (= (read) 1)
                       (score (+ p1 1) p2 1)
                       (score (+ p1 1) p2 0)
                       )
                   (if (= (read) 1)
                       (score p1 (+ p2 1) 1)
                       (score p1 (+ p2 1) 0)
                       )
                   
                  )
             )
             
         (if (= p1 p2)
             (score p1 p2 1)
             (if (> p1 p2)
                  (display "p1 wins")
                  (display "p2 wins")
                  )
          )
         
        
    )
    (newline)

    (if (= continue? 0)
        (display "With a score of ")
        )
    (if (= continue? 0)
        (display (- p1 p2))
        )
    
    )
    
  (score 0 0 1)
  )


;Unsure if test cases needed here so I didn't have any, as the game itself is pretty self explanatory for testing
         
              
              
    
    







