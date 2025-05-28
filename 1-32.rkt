#lang racket

( define (accumulate combiner null-value term a next b) (
  if (> a b) null-value (combiner (term a) (accumulate combiner null-value term (next a) next b))
))

(define (accumulateitr combiner null-value term a next b) (
  if (> a b) null-value (accumulateitr combiner (combiner null-value (term a)) term (next a) next b)
))

(define (identity n) n)

(define (plus1 n) (+ 1 n))

(define (factorial n) (accumulateitr * 1 plus1 1 plus1 n))

(factorial 5)
