#lang racket

(define (sum-count term a next i count)
(if (> i count)
      0
      (+ (term a i)
         (sum-count term (next a) next (+ i 1) count)))
)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (h3 a b n) (/ (/ (- b a) n) 3))

(define (simpsons-rule function a b n)
    (define (simpsons-next x) (+ x (/ (- b a )n)))
    (define (simpsons-term x count) 
    (
      cond 
      ((= count 0) (function x))
      ((= 1 (remainder count 2)) (* 4 (function x)))
      (else  (* 2 (function x)))
    ))
    (* (h3 a b n) (sum-count simpsons-term a simpsons-next 0 n))
  )

(define (cube x) (* x x x))

(simpsons-rule cube 0 1 1000)