#lang racket

(define (double x) (* x 2))
(define (halve x ) (/ x 2))
(define (even? n) (= (remainder n 2) 0))


(define (smallest-divisor x) (smallest-divisor-itr x 2))

(define (smallest-divisor-itr x d) 
  (cond ((< x (* d d)) x)
       ((= (remainder x d) 0) d)
       (else (smallest-divisor-itr x (+ d 1))))
)
