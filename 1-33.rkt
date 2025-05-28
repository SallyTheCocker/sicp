#lang racket

(define (prime? x) (= (smallest-divisor-itr x 2) x))

(define (smallest-divisor-itr x d) 
  (cond ((< x (* d d)) x)
       ((= (remainder x d) 0) d)
       (else (smallest-divisor-itr x (next-divisor d))))
)

(define (GCD big small) (
  GCDrecur big small small
))

(define (GCDrecur big small curr) (
  if (and (= (remainder big curr) 0) (= 0 (remainder small curr))) curr (GCDrecur big small (- curr 1))
))

(define (next-divisor x) (
  if (< x 3) (+ x 1) (+ x 2)
))


( define (accumulate combiner null-value term a next b) (
  if (> a b) null-value (combiner (term a) (accumulate combiner null-value term (next a) next b))
))

(define (accumulateitr combiner null-value term a next b) (
  if (> a b) null-value (accumulateitr combiner (combiner null-value (term a)) term (next a) next b)
))

(define (filtered-accumulate combiner null-value term a next b filter) (
  if (> a b) null-value (filtered-accumulate combiner ( if (filter a) (combiner null-value (term a)) null-value) term (next a) next b filter)
))

(define (identity n) n)
(define (square n) (* n n))

(define (plus1 n) (+ 1 n))

(define (factorial n) (accumulateitr * 1 plus1 1 plus1 n))


(define (sum-squares-primes a b) (filtered-accumulate + 0 square a plus1 b prime?))


(define (productrelativeprime n) (
  define (relativePrime? i) ( = 1 (GCD n i)))
  (filtered-accumulate * 1 identity 1 plus1 n relativePrime?))

(productrelativeprime 11)
