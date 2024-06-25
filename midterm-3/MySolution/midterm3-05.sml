(* ****** ****** *)
use
"./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

(*
The following datatype gtree is for
non-empty general trees (where each node
can have an indefinite number of children)
*)

(* ****** ****** *)

datatype 'a gtree =
gtree_cons of ('a * ('a gtree) list)

(* ****** ****** *)

(*
HX: 10 points:
Please dfs-streamize a given gtree.
In other words, given a gtree xs, please
construct a stream consisting of the elements
in xs enumerated in the breadth-first order (that is,
breadth-first enumeration):
fun
gtree_dfs_streamize(xs: 'a gtree): 'a stream = ...
*)
		  
(* ****** ****** *)

fun
gtree_dfs_streamize
(xs: 'a gtree): 'a stream =
let
(* ****** ****** *)
fun
auxmain
(xss: ('a gtree) list): 'a stream = fn() =>
case xss of
  [] =>
  strcon_nil
| xs :: xss =>
(
  case xs of
    gtree_cons(x1, sub) =>
    strcon_cons(x1, auxmain(list_append(xss, sub)))
)
(* ****** ****** *)  
in
  auxmain([xs])
end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm3-05.sml] *)
