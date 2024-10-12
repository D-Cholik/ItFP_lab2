<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right"><b>Студент(-ка)</b>: Прізвище Ім'я По-батькові група</p>
<p align="right"><b>Рік</b>: рік</p>
## Загальне завдання
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за
можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно
реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового
списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій
для роботи зі списками, що не наведені в четвертому розділі навчального
посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції
в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (див. п. 2.3).
Додатковий бал за лабораторну роботу можна отримати в разі виконання всіх наступних
умов:
робота виконана до дедлайну (включно з датою дедлайну)
крім основних реалізацій функцій за варіантом, також реалізовано додатковий
варіант однієї чи обох функцій, який працюватиме швидше за основну реалізацію,
не порушуючи при цьому перші три вимоги до основної реалізації (вимоги 4 і 5
можуть бути порушені), за виключенням того, що в разі необхідності можна також
використати стандартну функцію copy-list
## Варіант №5
<p align="center">
<img src="variant51.png">
<img src="variant51.png">
</p>
## Лістинг функції remove-seconds
```lisp
(defun remove-seconds (lst)
  (if (or (null lst) (null (cdr lst)))
      lst  
      (cons (car lst) (remove-seconds (cddr lst)))))
```
### Тестові набори
```lisp
(defun test-remove-seconds ()
  (print "Test funck: remove-seconds")
  (print (list "Test list 1: (1 2 a b 3 4 d) -> " (remove-seconds '(1 2 a b 3 4 d))))
  (print (list "Test list 2: (1 2 a b 3 4 d 4 d f) -> " (remove-seconds '(1 2 a b 3 4 d 4 d f))))
  (print (list "Test list 3: (1 2 a) -> " (remove-seconds '(1 2 a))))
  (print (list "Test list 4: (1) -> " (remove-seconds '(1))))
  (print (list "Test list 5: () -> " (remove-seconds '()))))
(test-remove-seconds)
```
### Тестування
```
"Test funck: remove-seconds" 
("Test list 1: (1 2 a b 3 4 d) -> " (1 A 3 D)) 
("Test list 2: (1 2 a b 3 4 d 4 d f) -> " (1 A 3 D D)) 
("Test list 3: (1 2 a) -> " (1 A)) 
("Test list 4: (1) -> " (1)) 
("Test list 5: () -> " NIL) 
```
## Лістинг функції list-set-symmetric-difference
```lisp
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
```
### Тестові набори
```lisp
(defun test-list-set-symmetric-difference ()
  (print "Test funck: list-set-symmetric-difference")
  (print (list "Test list 1: (1 2 3 4) and (3 4 5 6) -> "  (list-set-symmetric-difference '(1 2 3 4) '(3 4 5 6)))) 
  (print (list "Test list 2: (1 1 2 2) and (2 3 4) -> " (list-set-symmetric-difference '(1 1 2 2) '(2 3 4)))) 
  (print (list "Test list 3: (a b c) and (b c d e) -> " (list-set-symmetric-difference '(a b c) '(b c d e)))) 
  (print (list "Test list 4: (1 2 3) and () -> " (list-set-symmetric-difference '(1 2 3) '()))) 
  (print (list "Test list 5: () and (5 6 7) -> "  (list-set-symmetric-difference '() '(5 6 7)))))
(test-list-set-symmetric-difference)
```
### Тестування
```
"Test funck: list-set-symmetric-difference" 
("Test list 1: (1 2 3 4) and (3 4 5 6) -> " (1 2 5 6)) 
("Test list 2: (1 1 2 2) and (2 3 4) -> " (1 1 3 4)) 
("Test list 3: (a b c) and (b c d e) -> " (A D E)) 
("Test list 4: (1 2 3) and () -> " (1 2 3)) 
("Test list 5: () and (5 6 7) -> " (5 6 7)) 
```
