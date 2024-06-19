(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

datatype 'a tree =
  tree_nil
| tree_cons of ('a tree * 'a * 'a tree)

(* ****** ****** *)

(*
The pre-order folding of a tree is implemented
as follows:
*)

(* ****** ****** *)

fun
tree_pre_fold
( xs: 'a tree
, r0: 'r
, fopr: 'a * 'r * 'r -> 'r): 'r =
(
case xs of
  tree_nil => r0
| tree_cons(tl, x0, tr) =>
  fopr(x0, tree_pre_fold(tl, r0, fopr)
         , tree_pre_fold(tr, r0, fopr))
)

(* ****** ****** *)

(*
HX-2024-06-18: 10 points
//
Please use tree_pre_fold to implement tree_fold (given in Q1).
That is, you should replace the following two occurrences of '...'
with some valid SML code:
//
fun
tree_fold
( xs: 'a tree
, r0: 'r
, fopr: 'r * 'a * 'r -> 'r): 'r = tree_pre_fold(xs, ..., ...)
//
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-02.sml] *)
