(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)

(* ****** ****** *)

fun list_tabulate(n: int, f: int -> 'a): 'a list =
    let
        fun aux(i: int, acc: 'a list): 'a list =
            if i < 0 then acc
            else aux(i - 1, f(i) :: acc)
    in
        aux(n - 1, [])
    end

(* end of [CS320-2024-Sum1-assign03-03.sml] *)
