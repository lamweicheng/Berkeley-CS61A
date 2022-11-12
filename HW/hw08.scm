
(define (my-filter pred s)                          ;in here we need recursive call in order to check every element in the list
    (cond ((null? s) nil)                           ;if list is empty then return the empty list
          ((pred (car s))                            ;if the first element in the list s statisfy the predicate, construct a list with that element, and recursive call to the next element in the list s

                  (cons (car s)
                  (my-filter pred (cdr s)))
          )
          (else (my-filter pred (cdr s)))         ;else, just move on to the another element in list s and 
    )
)         

          

(define (interleave lst1 lst2) 
      (if (null? lst1) lst2                 ;if lst1 is empty then just return lst2
      
      ;else
      (cons (car lst1)               ;else construct a list with the first element in lst1 , then recursive call lst2 with updated 2nd element of lst1 until the point one of the lst hits the base case
            (interleave lst2 (cdr lst1))
      )    
      )
)

(define (accumulate joiner start n term)
        (if (< n 1) start  ;if the number of natural number is less than 1, then we just skip that n and join with start
        
        ;else
        (accumulate joiner (joiner start (term n)) (- n 1) term) ;recursive call , (joiner start (term n)) will be passed in as start and n will be deducted every single call
        )
      
)

(define (no-repeats lst)     
        (if (null? lst) lst ;if lst is empty then just return lst

        ;else
        (cons (car lst)     ;construct a list with the first element of the lst 
        (no-repeats (my-filter (lambda (x) (not (= x (car lst)))) ;then recursive call with the my-filter procedure that we created above, checking if the element in lst is the same as the element we passed in as x
                lst)))
        )
)
