;; progn lets you do more stuff in an if branch
;; by evaluating all the forms you pass to it
;; but only last one evaluated is returned
;; as the value of the full expression.
;;
;; This is how we can set *number-was-odd* to
;; true as well as return 'odd-number inside
;; the true path of an if form.

(defvar *number-was-odd* nil)

(if (oddp 5)
    (progn (setf *number-was-odd* t)
           'odd-number)
    'even-number)
