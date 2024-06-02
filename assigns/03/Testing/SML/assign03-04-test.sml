(* ****** ****** *)
(* ****** ****** *)
use
"./../../MySolution/SML/assign03-04.sml";
(* ****** ****** *)
(* ****** ****** *)
exception
Error320 of string option
fun
assert320
(claim: bool): unit =
if claim
  then () else raise Error320(NONE)
(* end of [assert320] *)
fun
assert320_some
(claim: bool, errmsg: string): unit =
if claim
  then () else raise Error320(SOME(errmsg))
(* end of [assert320_some] *)
(* ****** ****** *)
(* ****** ****** *)
val xs = []
val () =
assert320_some
(list_longest_ascend(xs) = xs, "assign03-04-test:1")
(* ****** ****** *)
val xs = [1, 2, 3, 4, 5]
val () =
assert320_some
(list_longest_ascend(xs) = xs, "assign03-04-test:2")
(* ****** ****** *)
val xs = [5, 4, 3, 2, 1]
val () =
assert320_some
(list_longest_ascend(xs) = [5], "assign03-04-test:3")
(* ****** ****** *)
val xs = [2, 1, 3, 3, 4, 4, 5]
val () =
assert320_some
(list_longest_ascend(xs) = [2, 3, 3, 4, 4, 5], "assign03-04-test:4")
(* ****** ****** *)
val xs = [2, 1, 1, 3, 3, 2, 4, 4, 5]
val () =
assert320_some
(list_longest_ascend(xs) = [1, 1, 3, 3, 4, 4, 5], "assign03-04-test:5")
(* ****** ****** *)
val xs = [2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5]
val () =
assert320_some
(list_longest_ascend(xs) = [2, 2, 3, 3, 4, 4, 5, 5], "assign03-04-test:6")
(* ****** ****** *)
val xs =
[4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1]
val () = 
assert320_some
(list_longest_ascend(xs) = [1, 1, 1, 1, 1, 1, 1, 1, 1], "assign03-04-test:7")
(* ****** ****** *)
val () = print("Assign03-04-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-04-test.sml] *)
