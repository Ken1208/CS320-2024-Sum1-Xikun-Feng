(* ****** ****** *)

use "../MySolution/date_succ.sml";

(* ****** ****** *)

exception DateSuccError

fun
assert(claim: bool): unit =
if (claim = false)
then raise DateSuccError else ()

(* ****** ****** *)

val d_2000_2_28 =
  {year=2000,month=2,day=28}
val d_2000_2_29 = date_succ(d_2000_2_28)
val d_2000_3_01 = date_succ(d_2000_2_29)

val () =
assert(d_2000_2_29 = {year=2000,month=2,day=29})
val () =
assert(d_2000_3_01 = {year=2000,month=3,day=01})

(* ****** ****** *)						  

val d_2024_2_28 =
  {year=2024,month=2,day=28}
val d_2024_2_29 = date_succ(d_2024_2_28)
val d_2024_3_01 = date_succ(d_2024_2_29)

val () =
assert(d_2024_2_29 = {year=2024,month=2,day=29})
val () =
assert(d_2024_3_01 = {year=2024,month=3,day=01})

(* ****** ****** *)

val d_2024_5_31 =
  {year=2024,month=5,day=31}
val d_2024_6_01 = date_succ(d_2024_5_31)
val () =
assert(d_2024_6_01 = {year=2024,month=6,day=01})

(* ****** ****** *)

val () =
print("Hey, your [date_succ] passed the test!\n")

(* ****** ****** *)

(* end of [quizzes/quiz01/date_succ_test.sml] *)
