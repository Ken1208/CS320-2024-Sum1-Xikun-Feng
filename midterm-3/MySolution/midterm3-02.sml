(* ****** ****** *)

(*
HX-2024-06-25: 10 points
*)

(* ****** ****** *)

(*
Following is an implementation that
reverses a given list:

fun
list_pair_swap
( xs: 'a list ): 'a list =
(
  case xs of
    [] => []
  | x1 :: [] => [x1]
  | x1 :: x2 :: xs => x2 :: x1 :: list_pair_swap(xs)
)

*)

(* ****** ****** *)

Please given a NON-RECURSIVE implementation of
list_pair_swap based on [list_ifoldright]

(* ****** ****** *)

val
list_pair_swap = list_ifoldright(xs, blank1, blank2)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm3-02.sml] *)
