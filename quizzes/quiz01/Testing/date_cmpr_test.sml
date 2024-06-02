(* ****** ****** *)

use "../MySolution/date_cmpr.sml";

(* ****** ****** *)

exception DateCmprError

fun
assert(claim: bool): unit =
if (claim = false)
then raise DateCmprError else ()

(* ****** ****** *)

val sgn0 =
date_cmpr("01/01/2001", "01/01/2001")
val sgn1 =
date_cmpr("12/31/2000", "01/01/2001")
val sgn2 =
date_cmpr("02/01/2001", "01/31/2001")
val nsgn2 =
date_cmpr("01/31/2001", "02/01/2001")

(* ****** ****** *)

val () = assert(sgn0 = 0)
val () = assert(sgn1 = ~1)
val () = assert(sgn2 = 1)
val () = assert(nsgn2 = ~1)

(* ****** ****** *)

val () =
print("Hey, your [date_cmpr] passed the test!\n")

(* ****** ****** *)

(* end of [quizzes/quiz01/date_cmpr_test.sml] *)
