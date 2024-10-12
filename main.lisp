(defun remove-seconds (lst)
  (if (or (null lst) (null (cdr lst)))
      lst  
      (cons (car lst) (remove-seconds (cddr lst)))))

(defun test-remove-seconds ()
  (print "Test funck: remove-seconds")
  (print (list "Test list 1: (1 2 a b 3 4 d) -> " (remove-seconds '(1 2 a b 3 4 d))))
  (print (list "Test list 2: (1 2 a b 3 4 d 4 d f) -> " (remove-seconds '(1 2 a b 3 4 d 4 d f))))
  (print (list "Test list 3: (1 2 a) -> " (remove-seconds '(1 2 a))))
  (print (list "Test list 4: (1) -> " (remove-seconds '(1))))
  (print (list "Test list 5: () -> " (remove-seconds '()))))
(test-remove-seconds)

(defun list-set-symmetric-difference (set1 set2)
  (append (unique-elements set1 set2)
          (unique-elements set2 set1)))

(defun unique-elements (set1 set2)
  (cond
    ((null set1) nil)
    ((find-element (car set1) set2) (unique-elements (cdr set1) set2))
    (t (cons (car set1) (unique-elements (cdr set1) set2)))))

(defun find-element (elem list)
  (cond
    ((null list) nil)
    ((eql elem (car list)) t)
    (t (find-element elem (cdr list)))))

(defun test-list-set-symmetric-difference ()
  (print "Test funck: list-set-symmetric-difference")
  (print (list "Test list 1: (1 2 3 4) and (3 4 5 6) -> "  (list-set-symmetric-difference '(1 2 3 4) '(3 4 5 6)))) 
  (print (list "Test list 2: (1 1 2 2) and (2 3 4) -> " (list-set-symmetric-difference '(1 1 2 2) '(2 3 4)))) 
  (print (list "Test list 3: (a b c) and (b c d e) -> " (list-set-symmetric-difference '(a b c) '(b c d e)))) 
  (print (list "Test list 4: (1 2 3) and () -> " (list-set-symmetric-difference '(1 2 3) '()))) 
  (print (list "Test list 5: () and (5 6 7) -> "  (list-set-symmetric-difference '() '(5 6 7)))))
(test-list-set-symmetric-difference)
