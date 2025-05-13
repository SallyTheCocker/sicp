#lang racket

(define (abs x) (if (< x 0) (- x) x))

(define (goodEnough guess radicand) (> 0.01 (abs (- 1 (/ (improveGuess guess radicand) guess)))))

(define (improveGuess guess radicand) (/ (+ guess (/ radicand guess)) 2))

(define (sqaureRootItr guess radicand)(
    if (goodEnough guess radicand) guess (sqaureRootItr (improveGuess guess radicand) radicand)
))

(define (squareRoot x) (sqaureRootItr 1 x))

(define (cubeImproveGuess guess radicand) (/ (+ (/ radicand (* guess guess)) (* 2 guess)) 3))

(define (cubeGoodEnough guess radicand) (> 0.01 (abs (- 1 (/ (cubeImproveGuess guess radicand) guess)))))

(define (cubeRootItr guess radicand)(
    if (cubeGoodEnough guess radicand) guess (cubeRootItr (cubeImproveGuess guess radicand) radicand)
))

(define (cubeRoot x) (cubeRootItr 1 x))

(cubeRoot 8)



