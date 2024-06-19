(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

datatype 'a tree =
  tree_nil
| tree_cons of ('a tree * 'a * 'a tree)

(* ****** ****** *)

(*
The pre-order 'foreach' on a binary tree is implemented
as follows:
*)

(* ****** ****** *)

fun
tree_pre_foreach
(xs: 'a tree, work: 'a -> unit): unit =
(
case xs of
  tree_nil => ()
| tree_cons(tl, x0, tr) =>
  (work(x0); tree_pre_foreach(tl, work); tree_pre_foreach(tr, work))
)

(* ****** ****** *)

(*
HX-2024-06-18: 20 points
The above implementation of [tree_pre_foreach] is not tail-recursive.
Please give a tail-recursive implementation of [tree_pre_foreach], which
should be called [tree_pre_foreach_trec]:

fun
tree_pre_foreach_trec
(xs: 'a tree, work: 'a -> unit): unit = ...
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-03.sml] *)
