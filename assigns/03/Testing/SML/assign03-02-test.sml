(* ****** ****** *)
use
"./../../MySolution/SML/assign03-02.sml";
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
val () =
assert320_some
(list_range(1, 1) = [], "assign03-02-test:1")
val () =
assert320_some
(list_range(2, 1) = [], "assign03-02-test:2")
val () =
assert320_some
(list_range(1, 5) = [1,2,3,4], "assign03-02-test:3")
(* ****** ****** *)
val () =
assert320_some
(list_range(~4, 0) = [~4,~3,~2,~1], "assign03-02-test:4")
(* ****** ****** *)
val () = print("Assign03-02-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-02-test.sml] *)
