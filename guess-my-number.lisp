;; Asterisks surrounding variable names denote globals -
;; They're totally optional and arbitrary. Lispers affectionately
;; call them "earmuffs".

(defparameter *small* 1)

(defparameter *big* 100)

;; Instead of defparameter we could instead use defvar to
;; define values once that don't change, even after extra
;; calls of defvar to "override" a value:
;;
;; > (defvar *foo* 5)
;; FOO
;; > *foo*
;; 5
;; > (defvar *foo* 6)
;; FOO
;; > *foo*
;; 5
;;
;; Enough commentary, let's define the guess-my-number function!

(defun guess-my-number ()
  (ash (+ *small* *big*) -1))

;; ash is the arithmetic shift function, built into common lisp.
;; It looks at a number in binary form, and then shifts its binary
;; bits to the left or right, dropping any bits lost in the process.
;; For example, the number 11 written in binary is 1011. We can move
;; the bits in this number to the left with ash by using 1 as the
;; second argument:
;;
;; > (ash 11 1)
;; 22
;;
;; This produces 22, which is 10110 in binary. We can move the bits
;; to the right (and lop off the bit on the end) by passing in -1 as
;; the second argument:
;;
;; > (ash 11 -1)
;; 5
;;
;; Moving on, let's define smaller and bigger:

(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

;; We can use setf to change the value of global variables
;; Now let's define start-over

(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))
