(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)
(*
fun
find_root(f0: int -> int): int = ...
*)

(* ****** ****** *)

fun find_root(f0: int -> int): int =
    let
        fun loop(i: int): int =
            if f0(i) = 0 then i
            else if f0(~i) = 0 then ~i
            else loop(i+1)
    in
        loop(0)
    end

(* end of [CS320-2024-Sum1-assign03-01.sml] *)
