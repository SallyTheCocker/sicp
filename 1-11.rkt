#lang racket

(define (f n ) (if (< n 3) n (+ (f (- n 1)) (* 2 (f ( - n 2))) (* 3 (f ( - n 3))))))


(define (fitr n) (if (< n 3) n (fitrimp n 3 2 1 0)))

(define (fitrimp n curr m1 m2 m3) 
    (if (= n curr) (calc m1 m2 m3) (fitrimp n (+ curr 1) (calc m1 m2 m3) m1 m2)))


(define (frecr n ) (if (< n 3) n (calc(frecr(- n 1))(frecr(- n 2))(frecr(- n 3)))))

(define (calc m1 m2 m3) (+ m1 (* 2 m2) (* 3 m3)))
