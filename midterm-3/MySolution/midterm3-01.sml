(* ****** ****** *)

(*
HX-2024-06-25: 10 points
*)

(* ****** ****** *)

(*
Following is an implementation that
reverses a given list:

fun
my_list_reverse
( xs: 'a list ): 'a list =
(
  case xs of
    [] => []
  | x1 :: xs => my_list_reverse(xs) @ [x1]
)

*)

(* ****** ****** *)

(*
Please define [blank1] and [blank2] in the
following code so that the code corresponds to
the above implementation.
*)
(*
Note that You are allowed to use only functions
appearing in the above implementation.
*)

val
my_list_reverse = list_foldright(xs, blank1, blank2)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm3-01.sml] *)
