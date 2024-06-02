(* ****** ****** *)

val strsub = String.sub

(* ****** ****** *)

(*
A valid date string is of the format
"mm/dd/yyyy", where d, m, and y represent digits.
For instance, today's date is "05/31/2024".
*)

(*
Given two date strings date1 and date2, the
following function returns -1, 0, or 1, if date1
is before, the same as, or after date2, respectively.
*)
		      
(*
fun
date_cmpr
( date1: string
, date2: string): int = raise NotImplemented
*)
(* ****** ****** *)

(*
Please give your implementation of [date_cmpr] below *)

(* ****** ****** *)

fun charlst_cmpr
(cs1: char list, cs2: char list): int =
(
case cs1 of
  [] =>
  (case cs2 of [] => 0 | _ => ~1)
| c1 :: cs1 =>
  (
  case cs2 of
    [] => 1
  | c2 :: cs2 =>
    if c1 < c2 then ~1 else
    (if c1 > c2 then 1 else charlst_cmpr(cs1, cs2)))
)

(* ****** ****** *)

fun
date_cmpr
( date1: string
, date2: string): int =
let
val cs1 =
[
strsub(date1, 6),strsub(date1, 7),
strsub(date1, 8),strsub(date1, 9),
strsub(date1, 0),strsub(date1, 1),
strsub(date1, 3),strsub(date1, 4)]
val cs2 =
[
strsub(date2, 6),strsub(date2, 7),
strsub(date2, 8),strsub(date2, 9),
strsub(date2, 0),strsub(date2, 1),
strsub(date2, 3),strsub(date2, 4)]
in
  charlst_cmpr(cs1, cs2)
end

(* ****** ****** *)

val sgn1 =
date_cmpr("12/31/2000", "01/01/2001")
val sgn2 =
date_cmpr("02/01/2001", "01/31/2001")

(* ****** ****** *)

(* end of [quizzes/quiz01/date_cmpr.sml] *)

