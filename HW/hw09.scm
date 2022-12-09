(define-macro (when condition exprs)
   ; `(if ,condition ,(cons `begin exprs)  `okay )
   (list 'if condition (cons 'begin exprs) ''okay)
  
)


(define-macro (switch expr cases)
  (cons 'begin
        (map (_________ (_________)
                        (cons 'begin (cdr case)))
             cases)))
