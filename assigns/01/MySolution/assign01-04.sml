(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
str2int
(cs: string): int =
raise MyNotImplementedExn
*)

fun str2int(cs: string): int =
    let
        val len = strlen(cs)
        fun loop(i: int, acc: int): int =
            if i < len then
                let
                    val c = strsub(cs, i)
                    val n = ord(c) - ord(#"0")
                in
                    loop(i + 1, acc * 10 + n)
                end
            else
                acc
    in
        loop(0, 0)
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-04.sml] *)
