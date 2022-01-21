#|
Author: Raden Mathieu Almaden
Student #: 101104851
Course: COMP 3007
Assignment 3 Question 3
|#



;a

;Uses reucrsion to apply pred to each val of tree and removes those that dont satisfy the predicate
(define (tree-filter predicate tree)
  (if (equal? '() tree)
      '()
      (if (list? (car tree))
          (cons (tree-filter predicate (car tree)) (tree-filter predicate (cdr tree)))
          (if (predicate (car tree))
              (cons (car tree) (tree-filter predicate (cdr tree)))
              (tree-filter predicate (cdr tree))))))


;Testing

(display "Testing a) ~~~~~~~~~~~~~~~~")

(display "(tree-filter even? (list 1 2 3 4 (list 8 (list 10 11 13))))
         expected: (2 4 (8 (10)))   actual: ")
(tree-filter even? (list 1 2 3 4 (list 8 (list 10 11 13))))

(newline)

(display "(tree-filter (lambda(x)(= 0 (modulo x 4))) (list 1 2 3 4 (list 8 (list 10 11 13 '(20)))))
         expected: (4 (8 ((20))))   actual: ")
(tree-filter (lambda(x)(= 0 (modulo x 4))) (list 1 2 3 4 (list 8 (list 10 11 13 '(20)))))

(newline)

(display "(tree-filter even? '(1 (2 3) ((4 5) (6 7)) (((8 (9))))))
         expected: ((2) ((4) (6)) (((8 ()))))   actual: ")
(tree-filter even? '(1 (2 3) ((4 5) (6 7)) (((8 (9))))))


;b

;Finds depth of tree
(define (height tree)

;Iterator through nodes to find leaves and their depth
  (define (curHeight L depth)
    (if (not (list? L)) ;is node list?
        depth 
        (if (null? (cdr L)) 
            (if (list? (car L))
                (curHeight (car L) (+ 1 depth))
                (if (= 0 depth) 
                    1 ;if the node is a leaf then its depth is 1
                    depth))
            (if (>= (curHeight (car L) (+ 1 depth)) (curHeight (cdr L) (+ 1 depth)))
                (curHeight (car L) (+ 1 depth))
                (curHeight (cdr L) (+ 1 depth))
                ))
        )
    )

  (curHeight tree 0)
  
  )

;Testing
(display "Testing b) ~~~~~~~~~~~~~~~~)")
(newline)
(display "(height 'a)   expected: 0   actual: ") 
(height 'a)
(newline)

(display "(height '(a))   expected: 1   actual: ")
(height '(a))
(newline)

(display "(height '(a (b) c))   expected: 2   actual: ")
(height '(a (b) c))
(newline)

(display "(height '(((((a(((b))))))))))   expected: 8   actual: ")
(height '(((((a(((b)))))))))

;c
(define (flattenList tree)


  ;Our extra variable is to store values that aren't in the list (leaves)
  (define (walk t extra)
    (if (not (null? t))
        (if (list? t)
            (walk (car t) (walk (cdr t) extra))
             (cons t extra))
        extra))
  (walk tree '())
  )

;Testing
(display "Testing c) ~~~~~~~~~~~~~~~~")
(newline)

(display "(flattenList '((1) (2 3) ((4 5 6 (7)))(((8 (9))))))
expected: (1 2 3 4 5 6 7 8 9)   actual: ")
(flattenList '((1) (2 3) ((4 5 6 (7)))(((8 (9))))))

(newline)(display "flattenList '(((((5)))))))   expected: (5)   actual: ")
(flattenList '(((((5))))))

(newline)(display "flattenList '(((((5 3 2 1 6) 1 2 3 4)))))   expected: (5 3 2 1 6 1 2 3 4)   actual: ")
(flattenList '(((((5 3 2 1 6) 1 2 3 4)))))

;d ??


