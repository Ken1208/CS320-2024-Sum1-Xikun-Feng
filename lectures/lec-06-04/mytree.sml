datatype
'a tree =
  tree_nil (* empty *)
| tree_cons of 'a tree * 'a * 'a tree

(*
fun
tree_fold
( xs: 'a tree
, r0: 'r, fopr: ('r * 'a * 'r) -> 'r): 'r
*)

(*
Please implement [tree_fold].
Then use [tree_fold] to implement
[tree_size],
[tree_height], [tree_flatten], etc *)

(*
If you have more time,
please introduce search trees and
then do [tree_search] and [tree_insert]
*)
				 
type 'itm treemap = (string * 'itm) tree

fun tree_search
(map: 'itm treemap, key: string): 'itm option

fun tree_insert
( map: 'itm treemap
, key: string, itm: 'itm): 'itm treemap

(* ****** ****** *)

(* end of [mytree.sml] *)
