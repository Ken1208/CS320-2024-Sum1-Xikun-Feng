(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

datatype 'a tree =
  tree_nil
| tree_cons of ('a tree * 'a * 'a tree)

(* ****** ****** *)

(*
The in-order folding of a tree is implemented
as follows:
*)

(* ****** ****** *)

fun
tree_fold
( xs: 'a tree
, r0: 'r
, fopr: 'r * 'a * 'r -> 'r): 'r =
(
case xs of
  tree_nil => r0
| tree_cons(tl, x0, tr) =>
  fopr(tree_fold(tl, r0, fopr), x0, tree_fold(tr, r0, fopr))
)

(* ****** ****** *)

(*
HX-2024-06-18: 10 points
//
The function 'tree_size' computes the size of a given tree xs
(that is, the number of elements in xs). How do you implement
tree_size based on tree_fold? In particular, please replace '...'
with valid SML code as follows:
//
fun
tree_size
(xs: 'a tree): int = tree_fold(xs, ..., ...)
//
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-01.sml] *)
