(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

(* ****** ****** *)



fun xlist_size (xs: 'a xlist): int =
    case xs of
         xlist_nil => 0
       | xlist_cons(x1, xs) => 1 + xlist_size(xs)
       | xlist_append(x1, xs) => xlist_size(x1) + xlist_size(xs)
       | xlist_reverse(x1) => xlist_size(x1)
       | xlist_snoc(xs, x1) => 1 + xlist_size(xs)



(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-01.sml] *)
