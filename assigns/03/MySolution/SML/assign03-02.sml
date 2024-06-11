(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
list_range(x, y) returns a list consisting
of all the integers i satisfying x <= i < y.
//
For instance,
list_range(1, 1) = []
list_range(2, 1) = []
list_range(0, 5) = [0,1,2,3,4]
//
Please give a tail-recusive implementation of
the list_range function
//
fun list_range(start: int, finish: int): int list
*)

(* ****** ****** *)

fun list_foldl(xs: 'a list, r0: 'b, f0: 'b * 'a -> 'b): 'b =
case xs of [] => r0
	 | x1 :: xs => list_foldl(xs, f0(r0, x1), f0)

fun list_reverse(xs: 'a list): 'a list =
list_foldl(xs, [], fn(r0, x1) => x1 :: r0)

fun list_range(start: int, finish: int): int list =
    let
        fun aux(current: int, acc: int list): int list =
            if current >= finish then acc
            else aux(current + 1, current :: acc)
    in
        list_reverse(aux(start, []))
    end

(* end of [CS320-2024-Sum1-assign03-02.sml] *)
