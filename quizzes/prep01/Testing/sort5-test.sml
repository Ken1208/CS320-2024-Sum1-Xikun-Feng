(* ****** ****** *)

use "./../MySolution/sort5.sml";

(* ****** ****** *)

local
exception Error
in
(* ****** ****** *)
(*
// HX-2024-05-21:
// Note that '13' may need to be
// changed to another value.
*)
(* ****** ****** *)
val xs = (2, 3, 4, 1, 5)
(* ****** ****** *)
val
(1, 2, 3, 4, 5) = sort5(xs)
(* ****** ****** *)
val () = print("sort5-test passed!\n")
(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-sort5-test.sml] *)
