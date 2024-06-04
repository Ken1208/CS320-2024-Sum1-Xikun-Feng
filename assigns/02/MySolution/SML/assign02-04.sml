(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-04: 10 points
//
Please recall the following question in Assign01:
Assign01-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)

fun str2int_opt (cs: string): int option =
    let
        fun char_to_int (c: char): int = ord(c) - ord(#"0")

        fun is_digit (c: char): bool = (#"0" <= c) andalso (c <= #"9")

        fun process_chars (chars: char list, acc: int): int option =
            case chars of
                nil => SOME acc
              | c :: cs =>
                if is_digit c then
                    process_chars(cs, acc * 10 + char_to_int(c))
                else
                    NONE

        val chars = explode(cs)
    in
        if list_size chars = 0 then
            NONE
        else
            process_chars(chars, 0)
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-04.sml] *)
