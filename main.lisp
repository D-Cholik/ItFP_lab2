(defun remove-seconds (lst)
  (if (or (null lst) (null (cdr lst)))
      lst  
      (cons (car lst) (remove-seconds (cddr lst)))))

(defun list-set-symmetric-difference (lst1 lst2)
  (append (unique-elements lst1 lst2)
          (unique-elements lst2 lst1)))

(defun unique-elements (lst1 lst2)
  (cond
    ((null lst1) nil)
    ((find-element (car lst1) lst2) (unique-elements (cdr lst1) lst2))
    (t (cons (car lst1) (unique-elements (cdr lst1) lst2)))))

(defun find-element (elem lst)
  (cond
    ((null lst) nil)
    ((eql elem (car lst)) t)
    (t (find-element elem (cdr lst)))))

(defun check-result (name actual expected)
  (format t "~:[FAILED~;passed~] ~a~%" (equal actual expected) name))

(defun test-remove-seconds ()
  (format t "~%Running tests for remove-seconds~%")
  (check-result "Test 1" (remove-seconds '(1 2 a b 3 4 d)) '(1 a 3 d))
  (check-result "Test 2" (remove-seconds '(1 2 a b 3 4 d 4 d f)) '(1 a 3 d f))
  (check-result "Test 3" (remove-seconds '(1 2 a)) '(1 a))
  (check-result "Test 4" (remove-seconds '(1)) '(1))
  (check-result "Test 5" (remove-seconds '()) '()))

(defun test-list-set-symmetric-difference ()
  (format t "~%Running tests for list-set-symmetric-difference~%")
  (check-result "Test 1" (list-set-symmetric-difference '(1 2 3 4) '(3 4 5 6)) '(1 2 5 6))
  (check-result "Test 2" (list-set-symmetric-difference '(1 1 2 2) '(2 3 4)) '(1 3 4))
  (check-result "Test 3" (list-set-symmetric-difference '(a b c) '(b c d e)) '(a d e))
  (check-result "Test 4" (list-set-symmetric-difference '(1 2 3) '()) '(1 2 3))
  (check-result "Test 5" (list-set-symmetric-difference '() '(5 6 7)) '(5 6 7)))

(test-remove-seconds)
(test-list-set-symmetric-difference)
