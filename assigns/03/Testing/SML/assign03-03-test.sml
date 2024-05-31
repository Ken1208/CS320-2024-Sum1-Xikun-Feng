(* ****** ****** *)
use (* for class library *)
"./../../../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
use
"./../../MySolution/SML/assign03-03.sml";
(* ****** ****** *)
val () =
assert320_some
(list_tabulate(0, fn(x:int) => 0) = [], "assign03-03-test:1")
(* ****** ****** *)
val () =
assert320_some
(list_tabulate(2, fn(x:int) => x+x) = [0,2], "assign03-03-test:2")
(* ****** ****** *)
val () =
assert320_some
(list_tabulate(3, fn(x:int) => x*x) = [0,1,4], "assign03-03-test:3")
(* ****** ****** *)
val () = print("Assign03-03-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-03-test.sml] *)
