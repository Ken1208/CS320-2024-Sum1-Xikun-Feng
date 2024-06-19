(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-01: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)

(* ****** ****** *)

fun partial_sums_series(i, sum) = fn () =>
  let
    val next_term = if i mod 2 = 0 then 1.0 / Real.fromInt(i + 1) else ~1.0 / Real.fromInt(i + 1)
    val next_sum = sum + next_term
  in
    strcon_cons (sum, partial_sums_series(i + 1, next_sum))
  end

val the_ln2_stream: real stream = partial_sums_series(1, 1.0)


(* end of [CS320-2024-Sum1-assign04-04.sml] *)
