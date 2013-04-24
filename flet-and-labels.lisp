;; With flet you can define one or more local functions:

(flet ((f (n)
          (+ n 10)))
  (f 5))

;; Here we can define 2 local functions:

(flet ((f (n)
          (+ n 10))
       (g (n)
          (- n 3)))
  (g (f 5)))

;; To make function names available in defined functions,
;; you can use the labels command instead - notice how b
;; can already refer to a after it was defined:

(labels ((a (n)
            (+ n 5))
         (b (n)
            (+ (a n) 6)))
  (b 10))

;; Interestingly enough, labels also lets you define
;; functions that call themselves, aka recursion.
