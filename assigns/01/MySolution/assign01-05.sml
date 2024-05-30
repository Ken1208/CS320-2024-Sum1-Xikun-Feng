(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
stringrev
(cs: string): string =
raise MyNotImplementedExn
*)

fun stringrev(cs: string): string =
    let
        val len: int = strlen cs
        fun reverseHelper(index: int, revCs: string): string =
            if index < 0 then revCs
            else reverseHelper(index - 1, strcat (revCs, str (strsub (cs, index))))
    in
        reverseHelper(len - 1, "")
    end;

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-05.sml] *)
