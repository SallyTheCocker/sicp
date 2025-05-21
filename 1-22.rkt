#lang racket

(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time)) #f))
(define (report-prime elapsed-time)
  (display " ***  ")
  (display elapsed-time)
  #t)

(define (prime? x) (= (smallest-divisor-itr x 2) x))

(define (smallest-divisor-itr x d) 
  (cond ((< x (* d d)) x)
       ((= (remainder x d) 0) d)
       (else (smallest-divisor-itr x (next-divisor d))))
)

(define (next-divisor x) (
  if (< x 3) (+ x 1) (+ x 2)
))

(define (find3primes x) (find3primesitr x 0))

(define (find3primesitr x found)
( if (< found 3)
  (if (timed-prime-test x) (find3primesitr (+ 2 x) (+ 1 found)) (find3primesitr (+ 2 x ) found))
  (+ 2 2)
) 
)

(find3primes 1000000000000001)
