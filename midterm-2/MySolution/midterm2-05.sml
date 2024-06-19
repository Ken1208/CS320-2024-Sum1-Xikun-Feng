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
Please bfs-streamize a given gtree.
In other words, given a gtree xs, please
construct a stream consisting of the elements
in xs enumerated in the level-order (that is,
breadth-first enumeration):
fun
gtree_bfs_streamize(xs: 'a gtree): 'a stream = ...
*)
		  
		  
(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-05.sml] *)
