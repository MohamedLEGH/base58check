#lang scribble/manual
@require[@for-label[base58check
                    racket/base]]

@title{Base58Check}
@author[(author+email "Mohamedd Amine LEGHERABA" "mohamed.amine.legheraba@gmail.com")]

@defmodule[base58check]

Package Description Here

Encoding and decoding functions for the @hyperlink["https://en.bitcoin.it/wiki/Base58Check_encoding"]{Base58Check} encoding.

@defproc[(base58check_encode [value string?]) string?]{
  Encodes @racketfont{value} to a base58 string.
  @racketfont{value} should be a hexadecimal string.
}

@defproc[(base58check_decode [value string?]) string?]{
  Decodes base58 string @racketfont{value} to a hexadecimal string.
}