fun fact(n: int): int =
  if n > 0 then n * fact(n-1) else 1

val fact10 = fact(10)

(* *********************************************** *)

fun kfact(n: int, k0: int -> int): int =
  if n > 0 then
    kfact(n-1, fn res => k0(n * res)) else k0(1)

fun fact(n) = kfact(n, fn res => res (*identity*)

(* *********************************************** *)

fun kfact(n: int, k0: int -> int): int =
  if n > 0 then
    kfact(n-1, fn res => k0(n * res)) else k0(k0((1))

val kfact3 = kfact(3, fn res => res) (* Why 36? *)

(* *********************************************** *)

fun kfact(n: int, k0: int -> int): int =
  if n > 0 then
    kfact(n-1, fn res => k0(k0(n * res))) else k0(1)

val kfact3 = kfact(3, fn res => res) (* Why 324? *)

(* *********************************************** *)

