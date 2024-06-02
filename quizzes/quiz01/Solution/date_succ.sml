type date =
{year: int, month: int, day: int}
	 
val today = {year=2024, month=5, day=31}

exception NotImplemented
(*
//
Year X is a leap year if
(1) X is a mutiple of 400, or
(2) X is a mutiple of 4 but not a mutiple of 100
For instance, year 2024 is a leap year.
//
In a leap year, there are 29 days in February.
In a non-leap year, there are only 28 days in February.
//
*)
(*
Given a valid date of a day, [date_succ] returns
the date of the following day.
*)
(*
fun
date_succ(date: date): date = raise NotImplemented
*)
(* ****** ****** *)

(*
Please give your implementation of [date_succ] below *)

(* ****** ****** *)

fun
date_succ
(date: date) = let
(* ****** ****** *)
  fun
  leap(y: int): bool =
  if
  (y mod 400 = 0)
  then true else
  (y mod 4 = 0 andalso y mod 100 <> 0)
  fun
  succ(y: int, m: int, d: int): int*int*int =
  case (y, m, d) of
    (y, 1, 31) => (y, 2, 1)
  | (y, 2, 28) => if leap(y) then (y, 2, 29) else (y, 3, 1)
  | (y, 2, 29) => (y, 3, 1)
  | (y, 3, 31) => (y, 4, 1)
  | (y, 4, 30) => (y, 5, 1)
  | (y, 5, 31) => (y, 6, 1)
  | (y, 6, 30) => (y, 7, 1)
  | (y, 7, 31) => (y, 8, 1)
  | (y, 8, 31) => (y, 9, 1)
  | (y, 9, 30) => (y, 10, 1)
  | (y, 10, 31) => (y, 11, 1)
  | (y, 11, 30) => (y, 12, 1)
  | (y, 12, 31) => (y+1, 1, 1)
  | (_,  _,  _) => (y, m, d+1)
(* ****** ****** *)
  val
  { year=y
  , month=m, day=d} = date
  val (y, m, d) = succ(y, m, d)
(* ****** ****** *)
in
  {year=y, month=m, day=d}
end (* end-of-[date_succ(date)] *)

(* ****** ****** *)

val tomorrow = date_succ(today)

(* ****** ****** *)

val d_2000_2_28 =
  {year=2000,month=2,day=28}
val d_2000_2_29 = date_succ(d_2000_2_28)
val d_2000_3_01 = date_succ(d_2000_2_29)

(* ****** ****** *)						  

val d_2024_2_28 =
  {year=2024,month=2,day=28}
val d_2024_2_29 = date_succ(d_2024_2_28)
val d_2024_3_01 = date_succ(d_2024_2_29)

(* ****** ****** *)						  

(* end of [quizzes/quiz01/date_succ.sml] *)
