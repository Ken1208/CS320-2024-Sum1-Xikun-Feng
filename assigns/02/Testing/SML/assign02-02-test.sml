(* ****** ****** *)
use (* for class library *)
"./../../../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign02-02.sml";
(* ****** ****** *)

local
exception Error
in(*local*)
(* ****** ****** *)
val xs = xlist_nil
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
(* ****** ****** *)
val () =
assert320_some(xlist_sub(xs, 0)=list_nth(list_of_xlist(xs), 0), "assign02-02-test:1")
(* ****** ****** *)
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
val () =
assert320_some(xlist_sub(xs, 3)=list_nth(list_of_xlist(xs), 3), "assign02-02-test:2")
(* ****** ****** *)
val () =
assert320_some((xlist_sub(xs, 10) handle XlistSubscript => 0)=(list_nth(list_of_xlist(xs), 10) handle Subscript => 0), "assign02-02-test:3")
val () =
assert320_some((xlist_sub(xs, 11) handle XlistSubscript => 0)=(list_nth(list_of_xlist(xs), 11) handle Subscript => 0), "assign02-02-test:3")
val () =
assert320_some((xlist_sub(xs, 12) handle XlistSubscript => 0)=(list_nth(list_of_xlist(xs), 12) handle Subscript => 0), "assign02-02-test:3")
(* ****** ****** *)

val () = print("Assign02-02-test passed!\n")

(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-02-test.sml] *)
