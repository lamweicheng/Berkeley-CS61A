(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)       ;we need to create a helper function here to keep track of the index
  ; BEGIN PROBLEM 15
    (define (helper s index)    
        (if (null? s) nil
        
        (cons (list index (car s))      ;construct a list where the first element is the index and the second is the first elemnt of the list s
        (helper (cdr s)(+ index 1)))    ;recursive call the helper function again
    
        )
      
    )

    (helper s 0) ;starts with index = 0 
   
)
    


  ; END PROBLEM 15


;; Problem 16

(2)(1)
;; Merge two lists LIST1 and LIST2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? list1 list2)
  ; BEGIN PROBLEM 16
    (cond
        ((null? list1) list2)       ;if list1 is empty, then return list2
        ((null? list2) list1)       ;if list2 is empty, then return list1
        
        (
          (ordered? (car list1)(car list2))          ;check if the first element of list1 is in ascending order compare to first erlement of list2
            (cons (car list1)(merge ordered? (cdr list1) list2)) ;if yes, then construct the first element of list1 and call the fucntion again
        )

        (
          (cons (car list2)(merge ordered? list1 (cdr list2))) 
        )
    )  
)
  ; END PROBLEM 16





;; Optional Problem 2

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )
        ((quoted? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           'replace-this-line
           ; END OPTIONAL PROBLEM 2
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           'replace-this-line
           ; END OPTIONAL PROBLEM 2
           ))
        (else
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )))

; Some utility functions that you may find useful to implement for let-to-lambda

(define (zip pairs)
  'replace-this-line)
