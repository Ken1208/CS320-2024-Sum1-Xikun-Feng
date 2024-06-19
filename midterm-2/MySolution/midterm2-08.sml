(* ****** ****** *)

(*
HX: 10 points:
(* ****** ****** *)
HX-2024-06-18: 10 points
(* ****** ****** *)
Given an infinite stream xs of integers,
the function stream_incgroup(xs) returns another
stream ys of integer lists, where each integer list
is a maximally increasing consecutive subsequenence
of xs. For instance, let xs = 1, 2, 3, 2, 3, 4, 5, 1, 2, 5, 1, 2, 0, ...
Then ys = [1,2,3], [2,3,4,5], [1,2,5], [1,2], ...
(* ****** ****** *)
fun
stream_incgroup(xs: int stream): (int list) stream = ...
(* ****** ****** *)
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-08.sml] *)
