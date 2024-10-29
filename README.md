<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b>
<p align="center">
<br>"Рекурсія"</br>
з дисципліни "Вступ до функціонального програмування"
</p>

<div style="display: flex; justify-content: flex-end;">
  <div style="border: 0px; padding: 10px;">
    <p>Студент: Чоловенко Дмитро Володимирович</p>
    <p>Група: КВ-13</p>
    <p>Рік: 2024</p>
  </div>
</div>

## Загальне завдання  
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:

1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій для роботи зі списками, що не наведені в четвертому розділі навчального посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.

Кожна реалізована функція має бути протестована для різних тестових наборів. Тести мають бути оформленні у вигляді модульних тестів (див. п. 2.3).

Додатковий бал за лабораторну роботу можна отримати в разі виконання всіх наступних умов:
- робота виконана до дедлайну (включно з датою дедлайну)
- крім основних реалізацій функцій за варіантом, також реалізовано додатковий варіант однієї чи обох функцій, який працюватиме швидше за основну реалізацію, не порушуючи при цьому перші три вимоги до основної реалізації (вимоги 4 і 5 можуть бути порушені), за виключенням того, що в разі необхідності можна також використати стандартну функцію `copy-list`.

## Варіант №5
<p align="center">
<img src="variant51.png" alt="Варіант 51">
<img src="variant52.png" alt="Варіант 52">
</p>  

## Лістинг функції `remove-seconds`
``` lisp
(defun remove-seconds (lst)
  (if (or (null lst) (null (cdr lst)))
      lst  
      (cons (car lst) (remove-seconds (cddr lst)))))
```
### Тестові набори
``` lisp
(defun check-result (name actual expected)
  (format t "~:[FAILED~;passed~] ~a~%" (equal actual expected) name))

(defun test-remove-seconds ()
  (format t "~%Running tests for remove-seconds~%")
  (check-result "Test 1" (remove-seconds '(1 2 a b 3 4 d)) '(1 a 3 d))
  (check-result "Test 2" (remove-seconds '(1 2 a b 3 4 d 4 d f)) '(1 a 3 d f))
  (check-result "Test 3" (remove-seconds '(1 2 a)) '(1 a))
  (check-result "Test 4" (remove-seconds '(1)) '(1))
  (check-result "Test 5" (remove-seconds '()) '()))
```
### Тестування
```
Running tests for remove-seconds
passed Test 1
FAILED Test 2
passed Test 3
passed Test 4
passed Test 5
```
## Лістинг функції `list-set-symmetric-difference`
```lisp
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
```
### Тестові набори
```lisp
(defun check-result (name actual expected)
  (format t "~:[FAILED~;passed~] ~a~%" (equal actual expected) name))

(defun test-list-set-symmetric-difference ()
  (format t "~%Running tests for list-set-symmetric-difference~%")
  (check-result "Test 1" (list-set-symmetric-difference '(1 2 3 4) '(3 4 5 6)) '(1 2 5 6))
  (check-result "Test 2" (list-set-symmetric-difference '(1 1 2 2) '(2 3 4)) '(1 3 4))
  (check-result "Test 3" (list-set-symmetric-difference '(a b c) '(b c d e)) '(a d e))
  (check-result "Test 4" (list-set-symmetric-difference '(1 2 3) '()) '(1 2 3))
  (check-result "Test 5" (list-set-symmetric-difference '() '(5 6 7)) '(5 6 7)))
```
### Тестування
```
Running tests for list-set-symmetric-difference
passed Test 1
FAILED Test 2
passed Test 3
passed Test 4
passed Test 5
```
