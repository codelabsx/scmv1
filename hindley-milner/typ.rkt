#lang typed/racket

(provide (all-defined-out))

(struct typ [] #:transparent)
(struct typ:freevar typ
  [(index : Integer)]
  #:transparent)

(struct typ:constructor typ
  [(name : String)
   (arg : (Listof typ))]
  #:transparent)

(: typ:builtin (-> String typ:constructor))
(define typ:builtin
  (lambda (name)
    (typ:constructor name '())))