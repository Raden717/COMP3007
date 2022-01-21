#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 4 Question 4
|#

(#%require test-engine/racket-tests)

(define (make-map)
  (define array '())
  (set! array '())


  ;  Adds a key-value pair to the existing array;
  ; input: key k , value V
  ; output: none
  (define (put! k v)
   
    ; Function that checks for duplicates and whether not the list is empty
    (define (walk remainingList)
      (if (null? array)
          (list (cons k v))
          (if (null? remainingList)
              (if (contains? k)
                  '()
                  (cons (cons k v) '()))
              (if (eqv? k (car (car remainingList)))
                  (cons (cons k v) (walk (cdr remainingList)))
                  (cons (car remainingList) (walk (cdr remainingList))))))
                   
      )
    (set! array (walk array))
    )
  
  ; Looks for the value of k based on the key using recursion
  ; input: key k
  ; output: key value
  (define (get k)
  
    (define (recurse L)
      (if (null? L)
          #f
          (if (equal? k (car (car L)))
              (cdr (car L))
              (recurse (cdr L)))))
    
    (recurse array)
    )

  ; Removes the key-value from the list if the key exists
  ; input: key k
  ; output: none
  (define (remove! k)

    (define (recurse lis)
      (if (null? lis)
          '()
          (if (equal? k (car (car lis)))
              (recurse (cdr lis))
              (cons (car lis) (recurse (cdr lis))))
      )
    )
    
    (if (contains? k)
        (set! array (recurse array))
        #f)
    )

  

  ; Checks if given key is in the map
  ; Input: key k
  ; Output: #t, #f
  (define (contains? k)
    ; Walks through list
    (define (recurse lis)
      (if (null? lis)
          #f
          (if (equal? k (car (car lis)))
              #t
              (recurse (cdr lis))))
      )
    (recurse array)
    )


  
  ; Checks if list is empty
  ; input: none
  ; output: #t, #f
  (define (empty?)
    (if (null? array)
        #t
        #f)
    )


  
  ; Prints the map
  ; Input: none
  ; Output: Map 'array'
  (define (print)
    array
    )


  
  ; Method for calling the appropriate procedure
  (define (dispatch method)
    (cond ((eq? method 'put!) put!)
          ((eq? method 'get) get)
          ((eq? method 'remove!) remove!)
          ((eq? method 'contains?) contains?)
          ((eq? method 'empty?) empty?)
          ((eq? method 'print) print)
          (else (lambda() (display "Unknown Request: ")
			      (display method)(newline)))))

  
  dispatch
  )

; Testing

(display "Initializing map with: ")(display "(define testMap (make-map))")(newline)(newline)

(define testMap (make-map))

(display "Testing if map is empty with ((testMap 'empty?)) expected: #t actual = ")
((testMap 'empty?))

(display "Printing the list: ((testMap 'print)) expected: () actual: ")
((testMap 'print))

(newline)

(display "Putting key-values in the list:
((testMap 'put!) 1 222)
((testMap 'put!) 2 111)
((testMap 'put!) 'a 'zzz)
((testMap 'put!) 4 'aaaaa)
((testMap 'put!) 'b 333)
")

   ((testMap 'put!) 1 222)
   ((testMap 'put!) 2 111)
   ((testMap 'put!) 'a 'zzz)
   ((testMap 'put!) 4 'aaaaa)
   ((testMap 'put!) 'b 333)

(newline)

(display "Testing if map empty expected: #f ((testMap 'empty?))   output = ")
((testMap 'empty?))

(newline)

(display "Testing printing the list: ((testMap 'print))
expected: ((1 . 222) (2 . 111) (a . zzz) (4 . aaaaa) (b . 333))
actual:   ")
((testMap 'print))

(newline)

(display "Testing if duplicate keys are replaced with new keys and values: ((testMap 'put!) 1 'newval)")(newline)
((testMap 'put!) 1 'NewVal)
(display "expected: ((1 . newval) (2 . 111) (a . zzz) (4 . aaaaa) (b . 333))")(newline)
(display "actual: ")
((testMap 'print))

(newline)

(display "Testing if duplicate keys are replaced with new keys and values: ((testMap 'put!) 'a 55555)")
(newline)
((testMap 'put!) 'a 55555)
(display "expected: ((1 . newval) (2 . 111) (a . 55555) (4 . aaaaa) (b . 333))")
(newline)
(display "actual: ")
((testMap 'print))

(newline)

(display "Testing if duplicate keys are replaced with new keys and values: ((testMap 'put!) 'b 'ddddd)")
(newline)
((testMap 'put!) 'b 'ddddd)
(display "expected: ((1 . newval) (2 . 111) (a . 55555) (4 . aaaaa) (b . ddddd))")
(newline)
(display "actual: ")
((testMap 'print))

(newline)

(display "Testing getting that does not exist: ((testMap 'get) 'doesnotexist)   expected: #f   actual: ")
((testMap 'get) 'doesnotexist)
(display "Testing getting a key that does exist: ((testMap 'get) 'a)   expected: 55555   actual: ")
((testMap 'get) 'a)(newline)

(display "Testing removing keys:
Removing a key that does not exist: ((testMap 'remove!) 'doesnotexist)
expected: #f
actual: ")
((testMap 'remove!) 'doesnotexist)

 
(display "Testing removing a key that does exist: ((testMap 'remove!) 'a)
Map before: ")
((testMap 'print))
((testMap 'remove!) 'a)
(display "Map after:  ")((testMap 'print))(newline)


(display "Testing contains:")
(newline)
(display "Current Map")((testMap 'print))
(newline)
(display "Testing contains on an element that does not exist: ((testMap 'contains?) 'doesnotexist)
expected: #f
actual: ")((testMap 'contains?) 'doesnotexist)
(newline)
(display "Testing contains on an element that does exist: ((testMap 'contains?) '1)
expected: #t
actual: ")((testMap 'contains?) '1)
(newline)
(display "Testing contains on an element that does exist: ((testMap 'contains?) '2)
expected: #t
actual: ")((testMap 'contains?) '2)
(newline)
(display "Testing contains on an element that does exist: ((testMap 'contains?) '4)
expected: #t
actual: ")((testMap 'contains?) '4)
(newline)
(display "Testing contains on an element that does exist: ((testMap 'contains?) 'b)
expected: #t
actual: ")((testMap 'contains?) 'b)