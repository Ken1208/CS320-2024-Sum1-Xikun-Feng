(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
(*
//
// HX-2024-06-11: 10 points
//
Recall the iforall combinator:

type
('seq, 'elt) iforall =
'seq * (int * 'elt -> bool) -> bool

For instance, list_iforall can be implemented
as follows:

fun
list_iforall(xs, itest) =
let
  fun loop(i0, xs) =
    case xs of
      [] => true
    | x1 :: xs =>
      if itest(i0, x1) then loop(i0+1, xs) else false
in
  loop(0, xs)
end
//
*)
(* ****** ****** *)

(*
Given a sequence xs and an integer, lengte(xs, n)
returns true if and only if the length of xs >= n
Please give an implementation of lengte based on iforall:
(*										     
fun iforall_to_lengte(iforall) = fn(xs, n) => ...
*)
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm1-04.sml] *)
