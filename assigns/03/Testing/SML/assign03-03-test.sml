(* ****** ****** *)
(* ****** ****** *)
use
"./../../MySolution/SML/assign03-03.sml";
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
val
list_whatever = fn(n, fopr) => int1_map_list(n, fopr)
(* ****** ****** *)
val () =
assert320_some
(list_whatever(0, fn(x:int) => 0) = [], "assign03-03-test:1")
(* ****** ****** *)
val () =
assert320_some
(list_whatever(2, fn(x:int) => x+x) = [0,2], "assign03-03-test:2")
(* ****** ****** *)
val () =
assert320_some
(list_whatever(3, fn(x:int) => x*x) = [0,1,4], "assign03-03-test:3")
(* ****** ****** *)
val () = print("Assign03-03-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-03-test.sml] *)
