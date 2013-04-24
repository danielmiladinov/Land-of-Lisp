;; Since it's kind of a pain to use progn every time you want
;; to do multiple things inside an if, Lisp has several other
;; commands that include an implicit progn. The most basic of
;; these are when and unless.
;;
;; With when, all the enclosed expressions are evaluated when
;; the condition is true. With unless, all the enclosed 
;; expressions are evaluated when the condition is false.
;;
;; The trade-off is that these commands can't do anything
;; when the condition evaluates in the opposite way; they
;; just return nil and do nothing

(defvar *number-is-odd* nil)

(when (oddp 5)
      (setf *number-is-odd* t)
      'odd-number)

;; > *number-is-odd*
;; T

(unless (oddp 4)
        (setf *number-is-odd* nil)
        'even-number)

;; > *number-is-odd*
;; NIL
