(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
HX-2023-06-05: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun
isPrime
(n0: int): bool =
let
fun
loop(i0: int): bool =
if
(i0 * i0 > n0)
then true else
(
if n0 mod i0 = 0
then false else loop(i0+1))
in
  if n0 >= 2 then loop(2) else false
end
*)

(* ****** ****** *)

fun list_exists(xs: 'a list, test: 'a -> bool): bool =
(
case xs of
  [] => false
| x1 :: xs =>
  if test(x1)
  then true else list_exists(xs, test))

fun range(start: int, stop: int): int list =
    if start > stop then [] else start :: range(start + 1, stop)

fun isPrime(n0: int): bool =
    if n0 < 2 then false
    else
        let
            val limit = floor(Math.sqrt(real n0))
            val candidates = range(2, limit)     
        in
            not (list_exists(candidates, fn i => n0 mod i = 0))
        end

(* end of [CS320-2024-Sum1-assign03-05.sml] *)
