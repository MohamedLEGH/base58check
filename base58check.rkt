#lang racket/base
(require racket/list)
(module+ test
  (require rackunit))

(define code-string
  "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz")
(define base (string-length code-string)) ; should give 58

; input: value, type = int
; output, type = base58 encoded string
(define (base58-encode value)
  (define (ref->string str k)
    (string (string-ref str k)))
  (define (base58enc acc val)
    (if (= val 0)
        acc
        (base58enc
         (string-append (ref->string code-string (modulo val base)) acc)
         (quotient val base))))
  (base58enc "" value))

; input: value, type = base58 encoded string
; output, type = int
(define (base58-decode value)
  (define code-list (string->list code-string))
  (define l (string->list value))
  (define reverse_l (reverse l))
  (define (base58dec acc power val)
    (if (equal? val '())
        acc
        (base58dec (+ (* (index-of code-list (car val)) (expt base power)) acc)
                   (+ power 1)
                   (cdr val))))
  (base58dec 0 0 reverse_l))

; input: value, type = hexastring
; output, type = base58 encoded string
(define (base58check-encode value)
  (define regex-val (regexp-match #rx"^[0]*" value))
  (define nb-0 (string-length (car regex-val)))
  (define nb-1 (quotient nb-0 2))
  (define prefix (make-string nb-1 #\1))
  (string-append prefix (base58-encode (string->number value 16))))

; input: value, type = base58 encoded string
; output, type = hexastring
(define (base58check-decode value)
  (define regex-val (regexp-match #rx"^[1]*" value))
  (define nb-1 (string-length (car regex-val)))
  (define nb-0 (* nb-1 2))
  (define prefix (make-string nb-0 #\0))
  (string-append prefix (number->string (base58-decode value) 16)))

(module+ test
  (check-equal? (base58check-encode
                 "0049c3307695e88874509b77ff859ab10064d1cb704733eea7")
                "17j29zgqUxMDTAgbBaZwEMFubHjnCrDpXp")
  (check-equal? (base58check-decode "17j29zgqUxMDTAgbBaZwEMFubHjnCrDpXp")
                "0049c3307695e88874509b77ff859ab10064d1cb704733eea7"))

(provide base58check-encode
         base58check-decode)
