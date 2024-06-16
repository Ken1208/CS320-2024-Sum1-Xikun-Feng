(* ****** ****** *)

datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)

type 'a stream = (unit -> 'a strcon)

(* ****** ****** *)

fun
stream_from
  (n: int): int stream = fn() =>
  strcon_cons(n, stream_from(n+1))

(* ****** ****** *)

fun
stream_filter
( fxs: 'a stream
, test: 'a -> bool): 'a stream = fn() =>
  case fxs() of
    strcon_nil => strcon_nil
  | strcon_cons(x1, fxs) =>
    if test(x1)
    then
    strcon_cons
    (x1, stream_filter(fxs, test))
    else stream_filter(fxs, test)((*unit*))

(* ****** ****** *)

fun sieve(fxs: int stream): int stream = fn() =>
  case fxs() of
    strcon_nil => strcon_nil (* this should be deadcode *)
  | strcon_cons(x1, fxs) => strcon_cons(x1, sieve(stream_filter(fxs, fn(x2) => not(x2 mod x1 = 0))))

(* ****** ****** *)

val thePrimes = sieve(stream_from(2))

val fxs = thePrimes
val strcon_cons(p1, fxs) = fxs()
val strcon_cons(p2, fxs) = fxs()
val strcon_cons(p3, fxs) = fxs()
val strcon_cons(p4, fxs) = fxs()
val strcon_cons(p5, fxs) = fxs()

(* ****** ****** *)

(* end of [lectures/lec-06-12.sml] *)


