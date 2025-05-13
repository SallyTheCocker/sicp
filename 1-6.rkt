#lang racket

(define (abs x) (if (< x 0) (- x) x))

(define (goodEnough guess radicand) (> 0.01 (abs (- 1 (/ (improveGuess guess radicand) guess)))))

(define (improveGuess guess radicand) (/ (+ guess (/ radicand guess)) 2))

(define (sqaureRootItr guess radicand)(
    if (goodEnough guess radicand) guess (sqaureRootItr (improveGuess guess radicand) radicand)
))

(define (squareRoot x) (sqaureRootItr 1 x))

(squareRoot 950)