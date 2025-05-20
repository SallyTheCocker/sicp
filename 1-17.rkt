#lang racket

(define (double x) (* x 2))
(define (halve x ) (/ x 2))
(define (even? n) (= (remainder n 2) 0))


(define (times a b) (
    cond ((= b 0) 0)
         ((even? b) (times (double a) (halve b)))
         (else (+ a (times a (- b 1))))
))

