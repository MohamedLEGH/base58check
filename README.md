base58check
===========

A package to encode and decode base58check encoding, according to the bitcoin documentation https://en.bitcoin.it/wiki/Base58Check_encoding.

# Installation
raco pkg install base58check

# Usage
```racket
> (require base58check)
> (base58check_encode "0049c3307695e88874509b77ff859ab10064d1cb704733eea7")
"17j29zgqUxMDTAgbBaZwEMFubHjnCrDpXp"
> (base58check_decode "17j29zgqUxMDTAgbBaZwEMFubHjnCrDpXp")
"0049c3307695e88874509b77ff859ab10064d1cb704733eea7"
```

# Documentation

https://docs.racket-lang.org/base58check/index.html