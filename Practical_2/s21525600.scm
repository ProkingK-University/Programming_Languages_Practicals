(define (circleArea r)
  (if (<= r 0)
      0
      (let ((pi (/ 22 7)))
        (* pi r r))))

(define (countDivisors n l)
  (cond
    ((null? l) 0)
    ((= 0 (remainder n (car l)))
     (+ 1 (countDivisors n (cdr l))))
    (else (countDivisors n (cdr l)))))

(define (getEveryEvenElement l)
  (cond
    ((null? l) '())
    ((null? (cdr l)) '())
    (else (cons (car(cdr l)) (getEveryEvenElement (cdr(cdr l)))))))

(newline)
(display "Testing Task 1")
(newline)
(display (circleArea 3.2))
(newline)

(newline)
(display "Testing Task 2")
(newline)
(display (countDivisors 10 '()))
(newline)
(display (countDivisors 10 '(20 50 60)))
(newline)
(display (countDivisors 10 '(1 20 30 2 5 40 10 60)))
(newline)

(newline)
(display "Testing Task 3")
(newline)
(display (getEveryEvenElement '()))
(newline)
(display (getEveryEvenElement '(a)))
(newline)
(display (getEveryEvenElement '(a b c d)))
(newline)

(exit)