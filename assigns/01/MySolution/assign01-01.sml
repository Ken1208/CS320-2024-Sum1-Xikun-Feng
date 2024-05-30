(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)


fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

fun find_overflow n =
  let
    val _ = fact n
  in
    find_overflow (n + 1)
  end
  handle Overflow => n;

val myans = find_overflow 1;


(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-01.sml] *)
