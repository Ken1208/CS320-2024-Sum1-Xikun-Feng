(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
Assign04-03:
HX-2023-06-15: 10 point
//
There is a concept 'exists'
that is dual to the concept of 'forall'.
//
Recall that a forall function takes a sequence
and a predicate (that is, a test function) and
checks whether all the elements satisfy the predicate.
//
A exists function takes a sequence and a predicate
and checks if there is an element in the sequence that
satisfies the predicate.
//
Please implement the following third-order
function that turns a forall function into
an exists function
//
fun
forall_to_exists
(forall: ('xs,'x0)forall_t): ('xs,'x0)exists_t
//
*)

(* ****** ****** *)
type
('xs, 'x0) forall_t =
'xs * ('x0 -> bool) -> bool
type
('xs, 'x0) exists_t =
'xs * ('x0 -> bool) -> bool
(* ****** ****** *)

(*
fun
forall_to_exists
(forall: ('xs,'x0)forall_t): ('xs,'x0)exists_t = ...
*)

(* ****** ****** *)

fun
forall_to_exists
(forall: ('seq, 'elt) forall_t): ('seq, 'elt) exists_t =
fn (xs, pred) =>
let
  val result = forall (xs, fn x => not (pred x))
in
  not result
end

(* end of [CS320-2024-Sum1-assign03-07.sml] *)
