#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 1 Question 4
|#


#|
Purpose: Verify a date based off user inputs
Input: No inputs in the function, however it'll prompt the user to input Year, Month, Day one by one in order
Output: boolean value that will determine whether the values used by the user in the prompt is valid
|#
(define (vali-date?)

  ;initializing values
  (define year 0)
  (define month 0)
  (define day 0)

  ;Determines if the year is a leap year
  (define (checkLeapYear x)
    (if (= 0 (modulo x 4))
        (if (= 0 (modulo x 100))
            (if (= 0 (modulo x 400)) 1 0)
            1)
    
        0)
  )

  ;Determines the number of days in the given month based on month and leapyearcheck (earlier function does this for us)
  (define (daysInMonth y leapyearCheck)

    (cond
      ((= 0 y) 0)
      ((= 1 y) 31) 
      ((= 2 y) (if (= leapyearCheck 1) 29 28))
      ((= 3 y) 31)
      ((= 4 y) 30)
      ((= 5 y) 31)
      ((= 6 y) 30)
      ((= 7 y) 31)
      ((= 8 y) 31)
      ((= 9 y) 30)
      ((= 10 y) 31)
      ((= 11 y) 30)
      ((= 12 y) 31)
      (else 0)
      )
  )

  ;Determines if the day is an actual day within the total amount of days within the month (earlier function does this for us)
  (define (validDayInMonth d daysInAMonth)
    (if (< d (+ daysInAMonth 1)) 1 0)
  )


  ;Prompts the user for input
  (display "Enter a year: " )
  (set! year (read))
  (display "Enter a month: " )
  (set! month (read))
  (display "Enter a day: " )
  (set! day (read))

  (define check 0) ;Initializing check value to determine if the date is false/true

  ;Checks if all the inputs are integers before anything else
  (if (integer? year) (if (> year 0) '() (set! check 1)) (set! check 1))
  (if (integer? month) (if (> month 0) '() (set! check 1)) (set! check 1))
  (if (integer? day) (if (> day 0) '() (set! check 1))  (set! check 1))

 
  (if (= check 1) ;Checks if any input has failed the checks
      #f
      (if (= 1 (validDayInMonth day (daysInMonth month (checkLeapYear year))) )  #t #f ) ;Runs the functions one by one to determine if the date is valid and returns #f or #t
      )
 

#| Test Cases

Year Month Day Output

2020 2 29      #t     Testing for Leap Year February 29
2OOO two 29    #f     Testing if non integer inputs work
0 1 29         #f     Testing if Year 0 exists (it shouldn't)
0 0 0          #f     Testing if 0/0/0
100 2 29       #f     Testing if year 100 is a leap year (shouldn't)
400 2 29       #t     Testing if year 400 is a leap year (it should)
1 1 1          #t     Testing 1/1/1 
0.01 1 1       #f     Testing if decimal inputs work (it shouldn't)
2019 6.1 12    #f     Testing decimal input on month
2020 11 21.6324 #f    Testing decimal input on day
-100 2 29      #f     Testing negative integers on year
-400 2 29      #f     Testing negative integers on leap years
2000 -2 29     #f     Testing negtaive integers on month
2000 2 -29     #f     Testing negative integers on day
1999 1 33      #f     Testing if days exceed the limit on the month
1999 13 2      #f     Testing months that dont exist
1999 0 1       #f     Testing if 0 month exists
2100 2 29      #f     Testing if a 100th multiple counts as a leap year
2400 2 29      #t     Testing if a 400th multiple counts as a leap year


|#
  
  
  






  )
