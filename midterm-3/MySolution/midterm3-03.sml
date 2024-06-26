(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

datatype 'a tree =
  tree_nil
| tree_cons of ('a tree * 'a * 'a tree)

(* ****** ****** *)

(*
The post-order 'foreach' on a binary tree is implemented
as follows:
*)

(* ****** ****** *)

fun
tree_post_foreach
(xs: 'a tree, work: 'a -> unit): unit =
(
case xs of
  tree_nil => ()
| tree_cons(tl, x0, tr) =>
  (tree_post_foreach(tl, work); tree_post_foreach(tr, work); work(x0))
)

(* ****** ****** *)

(*
HX-2024-06-25: 20 points
The above implementation of [tree_post_foreach] is not tail-recursive.
Please give a tail-recursive implementation of [tree_post_foreach], which
should be called [tree_post_foreach_trec]:

fun
tree_post_foreach_trec
(xs: 'a tree, work: 'a -> unit): unit = ...
*)

(* ****** ****** *)

fun tree_post_foreach_trec (xs: 'a tree, work: 'a -> unit): unit =
  let
    fun helper ([], _) = ()
      | helper (tree_nil :: ts, work) = helper (ts, work)
      | helper (tree_cons (tl, x0, tr) :: ts, work) =
          helper (tl :: tr :: tree_cons (tree_nil, x0, tree_nil) :: ts, work)
  in
    helper ([xs], work)
  end
  

(* end of [CS320-2024-Sum1-midterm3-03.sml] *)
