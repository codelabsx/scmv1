(define env0 '())

;;设置参数闭包
(struct Closure
    (parms body env))

(define extend
    (lambda (symbol value env)
        (cond (symbol . value) env)))

(define type)

(define lookup
    (lambda (symbol env)
        (let ([p (assq symbol env)])
            (cond 
                ((not p) #f)
                (else (cdr p))))))


;;首先进行类型检查
(define typecheck
    (lambda (exp env)
        (match exp
            ())))

;;然后开始编译
(define interp
    (lambda (exp env type-env)
        (match exp
            ((? number? exp) exp)
            ((? symbol? exp) (lookup exp env))
            (`(def var value) (extend var (interp value)))
            (`(declare ([: ,vars ,types ,value] ...)))
            (`(fun ([: ,parms ,in-types] ... [-> out-type]) body)               ;;进行类型检查
                (let* ([env1 (extend* parms in-types type-env)]                 ;;如果类型检查成功, 我们就可以进行编译
                       [actual (typecheck body env1)])
                       (cond 
                         ((equal? actual out-type) (Closure parms body env))
                         (else "type error, expect output type: " out-type ", 
                                but get the actual" actual))))
            (`(,op ,args ...)                                                   ;;函数调用
                (let ([op-type (typecheck op type-env)]                         ;;注意这个环境变量可能会出错
                      [args-types (map (lambda (a) (typecheck a type-env) args))])
                    (match op-type
                        ([`(-> ,in-types ... ,out-type)
                            (cond 
                                ((equal? arg-types in-typs) )
                                (else ))]))))))) 