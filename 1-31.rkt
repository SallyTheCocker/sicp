#lang racket

(define (product a b n) (
  productrec a b n))

(define (productitr a b n curr) (
  if (> a b) curr (productitr (+ a n) b n (* curr a))
))

(define (productrec a b n) (
  if (> a b) 1 (* a (productrec (+ a n) b n))
))

(define (factorial n) (product 1 n 1))
