type date =
{year: int, month: int, day: int}

val today = {year=2024, month=5, day=31}

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


fun Last_Day_non_leap(month: int): int =
  case month of
      1 => 31
    | 2 => 28
    | 3 => 31
    | 4 => 30
    | 5 => 31
    | 6 => 30
    | 7 => 31
    | 8 => 31
    | 9 => 30
    | 10 => 31
    | 11 => 30
    | 12 => 31

fun Last_Day_leap(month: int): int =
  case month of
      1 => 31
    | 2 => 29
    | 3 => 31
    | 4 => 30
    | 5 => 31
    | 6 => 30
    | 7 => 31
    | 8 => 31
    | 9 => 30
    | 10 => 31
    | 11 => 30
    | 12 => 31

fun date_succ(date: date): date =
  let
    val next_day = date.day + 1
    val Last_Day = if date.year mod 4 = 0 then Last_Day_leap(date.month) else Last_Day_non_leap(date.month)
  in
    if next_day > Last_Day then
      if date.month = 12 then
        { year = date.year + 1, month = 1, day = 1 }
      else
        { year = date.year, month = date.month + 1, day = 1 }
    else
      { year = date.year, month = date.month, day = next_day }
  end

	
(* ****** ****** *)

(* end of [quizzes/quiz01/date_succ.sml] *)
