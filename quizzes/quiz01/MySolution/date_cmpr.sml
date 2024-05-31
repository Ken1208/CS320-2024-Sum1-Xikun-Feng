(* ****** ****** *)

val strsub = String.sub

(* ****** ****** *)

A valid date string is of the format
"mm/dd/yyyy", where d, m, and y represent digits.
For instance, today's date is "05/31/2024".

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

fun date_cmpr (date1: string, date2: string): int =
	let
		val year1 = date1.year
		val year2 = date2.year
	in
		if year1 < year2 then -1
   		if year1 > year2 then 1
		if year1 == year2 then
			let
				val month1 = date1.month
				val month2 = date2.month
			in
				if month1 < month2 then -1
    				if month1 > month2 then 1
				if month1 == month2 then
					let
						val day1 = date1.day
						val day2 = date2.day
					in
				    		if day1 < day2 then -1
				    		if day1 > day2 then 1
						if day1 == day2 then 0
	end



(* ****** ****** *)

(* end of [quizzes/quiz01/date_cmpr.sml] *)
