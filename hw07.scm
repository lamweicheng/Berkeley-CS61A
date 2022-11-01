;return the rest of the list after the 2nd element 
(define (cddr s) (cdr (cdr s)))

;return the 2nd element of a list
(define (cadr s) (car (cdr s)))

;return the 3rd element of a list
(define (caddr s) (car (cdr (cdr s))))


;returns True if the numbers are in ascending order, and False otherwise
;in here, we need to do recursive function to loop through every single element in the list
;until the list is empty then return True
;the procedure will immediately return False if there's the next element in the list
;is smaller than the current element
(define (ascending? asc-lst)  
    (cond
        ((null? (cdr asc-lst)) #t) ;check the rest of the list if its empty (base case)
        ((> (car asc-lst) (cadr asc-lst)) #f) ;return False if the current element is bigger than the next element
        ((<= (car asc-lst) (cadr asc-lst)) (ascending? (cdr asc-lst))) ;recursive procedure call by slicing the current element if the current element is smaller than or equal to the next element
    ))


;return the square of value n 
(define (square n) (* n n))


(define (pow base exp) 
    (cond
        ((zero? exp) 1)
        ((even? exp) (square (pow base (/ exp 2))))
        ((odd? exp) (* base (pow base (- exp 1))))
        (/ 1 (pow base (- exp)))))
                       
;I did (pow base exp) procedure based on python code below
;below is the python code for which the number of operations grows logarithmically
        
    def pow_base_exp (base, exp):
        if exp == 0:
            return 1
        elif exp % 2 == 0:
            return pow_base_exp(x*x , exp/2)
        elif exp % 2 ==1:
            return base * pow_base_exp(base, (exp - 1))
        else:
            return 1/pow_base_exp(x, -n)

                       


               