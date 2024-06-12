(* ****** ****** *)
use
"./../../MySolution/SML/assign04-04.sml";
(* ****** ****** *)

local

exception ERROR_assign04_04

fun
myassert
(claim: bool): unit =
if claim
then () else raise ERROR_assign04_04

in (* in-of-local *)

(* ****** ****** *)
val eps = 0.001
(* ****** ****** *)  
val fxs = the_ln2_stream
(* ****** ****** *)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = myassert(abs(x1 - 1.0) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = myassert(abs(x1 - 0.5) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = myassert(abs(x1 - 0.833333) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = myassert(abs(x1 - 0.5833333) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = myassert(abs(x1 - 0.7833333) < eps)

(* ****** ****** *)

val () =
(
print
("the_ln2_stream(1000000) = ");
print
(
Real.toString
(
stream_get_at(the_ln2_stream, 1000000))^"\n"))

(* ****** ****** *)
val () = print( "Assign04-04-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-04-test.sml] *)
