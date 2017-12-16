(define remove-applic-lambda-nil
	(lambda (exp)
		(cond
			((not (list? exp)) 
				exp)
			((or (null? exp) (null? (car exp))) 
				'())
			((null? (cdr exp))
				(cond 
					((list? (car exp))
						(list (map remove-applic-lambda-nil (car exp))))
					(else
						exp)))
			((eq? 'applic (car exp))
						(if (> (length (cadr (cadr exp))) 0)
							(cons (car exp) (remove-applic-lambda-nil (cdr exp)))
							(remove-applic-lambda-nil (caddr (cadr exp))))
				)
			(else 
				(cons (car exp) (remove-applic-lambda-nil (cdr exp))))
			)))

(define box-set
  ;; fill in the variable boxing details here
  )

(define pe->lex-pe
  ;; fill in the lexical addressing details here
  )

(define annotate-tc
  ;; fill in the tail-call annotation details here
  )