#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 1 Question 1
|#


;Question 1 a) 1 + 2 - 3 + -4 - 5 + 6 = -3 should be the answer
(display "Question 1 a): ") (+ (- (+ (- (+ 1 2) 3)(- 4)) 5) 6) ; <-- Is the scheme expression

;Question 1 b) 20-9+((46/2 + 2)*(20/5 - 1)) = 86 should be the answer
(display "Question 1 b): ") (+ (- 20 9) (* (+ (/ 46 2) 2) (- (/ 20 5) 1) )) ; <-- Is the scheme expression

;Question 1 c) (123/12+(12/4-14/(13+2))*3)/4 = 4.1125 = 4 9/80 should be the answer
(display "Question 1 c): ") (/  (+ (/ 123 12) (* (- (/ 12 4) (/ 14 (+ 13 2)) ) 3) )  4) ; <-- Is the scheme expression

;Question 1 d) ((25*20)*4)+((19/4)+3.15)+((30*2)-47) = 2020.9 should be the answer
(display "Question 1 d): ")  (+ (+ (* (* 25 20) 4) (+ (/ 19 4) 3.15)) (- (* 30 2) 47)) ; <-- Is the scheme expression