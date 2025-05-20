#lang racket

(define (double x) (* x 2))
(define (halve x ) (/ x 2))
(define (even? n) (= (remainder n 2) 0))


(define (times a b) 
    (timesitr a b 0)
)

(define (timesitr a b r) (
    cond ((= b 1) (+ r a))
         ((even? b) (timesitr (double a) (halve b) r))
         (else (timesitr a (- b 1) (+ r a))
)))

(timesitr 5 4 0)