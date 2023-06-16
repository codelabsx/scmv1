#lang typed/racket

(provide type/infer)



(struct Context
  [(freevar-counter : Integer)]
  #:transparent
  #:mutable)



(: type/infer (-> expr typ))
(define type/infer
  (lambda (exp)
    (match exp
      ([expr:int _]  (typ:builtin "int"))
      ([expr:bool _] (typ:builtin "bool"))
      ([expr:string _] (typ:builtin "string")))))