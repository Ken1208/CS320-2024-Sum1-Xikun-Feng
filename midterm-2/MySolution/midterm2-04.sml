(* ****** ****** *)
datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)
type 'a stream = (unit -> 'a strcon)
(* ****** ****** *)

(*
HX: 10 points for this one:

Given a non-empty list [x1, x2, ..., xn],
please construct an infinite stream consisting
elements in the following order:

x1, x2, ..., xn, xn, ..., x2, x1,
x1, x2, ..., xn, xn, ..., x2, x1, ...

For instance, if the given list is [1, 2, 3], then
the stream represents: 1,2,3,3,2,1,1,2,3,3,2,1,...

fun midterm2_04(xs: 'a list): 'a stream = ...
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-04.sml] *)
