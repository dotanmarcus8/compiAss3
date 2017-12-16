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
						;(list (map remove-applic-lambda-nil (car exp))))
						(list (remove-applic-lambda-nil (car exp))))
					(else
						exp)))
			((eq? 'applic (car exp))
						(if (and (or (eq? 'lambda-simple (caadr exp)) (eq? 'lambda-opt (caadr exp))) (= (length (cadr (cadr exp))) 0))
						(remove-applic-lambda-nil (caddr (cadr exp)))
						(cons (car exp) (remove-applic-lambda-nil (cdr exp))))
				)
			(else
				(if (list? (car exp))
				(cons (remove-applic-lambda-nil (car exp)) (remove-applic-lambda-nil (cdr exp)))
				(cons (car exp) (remove-applic-lambda-nil (cdr exp)))))
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

; (display (remove-applic-lambda-nil '(applic (var a) ())))
; (display "\n")
; (display (remove-applic-lambda-nil '(applic (lambda-simple () (+ 1 2)) ())))
; (display "\n")
; (display (remove-applic-lambda-nil '(applic (lambda-simple (x) (+ 1 x)) (const 1))))
; (display "\n")
; (display (remove-applic-lambda-nil '(applic
; (lambda-simple
; (fact)
; (seq ((set (var fact) (box (var fact)))
; (box-set
; (var fact)
; (lambda-simple
; (n)
; (if3 (applic (var zero?) ((var n)))
; (const 1)
; (applic
; (var *)
; ((var n)
; (applic
; (box-get (var fact))
; ((applic (var -) ((var n) (const 1))))))))))
; (applic
; (lambda-simple () (applic (box-get (var fact)) ((const 5))))
; ()))))
; ((const #f)))))
