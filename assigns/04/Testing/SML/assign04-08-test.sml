(* ****** ****** *)
use
"./../../MySolution/SML/assign04-08.sml";
(* ****** ****** *)

local

exception ERROR_assign04_08

fun
myassert
(claim: bool): unit =
if claim
then () else raise ERROR_assign04_08

in (* in-of-local *)

(* ****** ****** *)
(*
val
stream_length = fn fxss =>
foreach_to_length(stream_foreach)(fxss)
*)
(* ****** ****** *)

val xs1 =
list_streamize[1]
val xs2 =
list_streamize[2,2,2]
val xs3 =
list_streamize[3,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
myassert(1 = stream_length(fxss))
val (  ) =
myassert([1,2,3] = stream_get_at(fxss,0))

(* ****** ****** *)

val xs1 =
list_streamize[1,2,3]
val xs2 =
list_streamize[1,2,3]
val xs3 =
list_streamize[1,2,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
myassert([1,1,1] = stream_get_at(fxss,0))
val (  ) =
myassert([2,2,2] = stream_get_at(fxss,1))
val (  ) =
myassert([3,3,3] = stream_get_at(fxss,2))

(* ****** ****** *)
val () = print( "Assign04-08-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-08-test.sml] *)
