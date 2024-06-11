(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)
(*
HX-2023-06-05: 10 point
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//
fun
list_subsets
(xs: 'a list): 'a list list =
(
case xs of
  nil => [[]]
| x1 :: xs =>
  let
    val res = list_subsets(xs)
  in
    res @ list_map(res, fn(xs) => x1 :: xs)
  end
)
//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant.
//
*)
(* ****** ****** *)

(*
val
list_subsets = fn(xs: 'a list) => ...
*)

(* ****** ****** *)

fun list_foldl(xs: 'a list, r0: 'b, f0: 'b * 'a -> 'b): 'b =
case xs of [] => r0
	 | x1 :: xs => list_foldl(xs, f0(r0, x1), f0)

fun list_foldr(xs: 'a list, r0: 'b, f0: 'a * 'b -> 'b): 'b =
list_foldl(list_reverse(xs), r0, fn(r0, x1) => f0(x1, r0))

fun list_append(xs: 'a list, ys: 'a list): 'a list =
list_foldl(xs, ys, fn(r0, x1) => x1 :: r0)

fun list_map(xs: 'a list, fopr: 'a -> 'b): 'b list =
list_foldr(xs, [], fn(x1, r0) => fopr(x1) :: r0)

fun list_subsets(xs: 'a list): 'a list list =
  list_foldl(xs, [[]], fn (acc, x) =>
    list_append(acc, list_map(acc, fn subset => x :: subset)))


(* end of [CS320-2024-Sum1-assign03-06.sml] *)
