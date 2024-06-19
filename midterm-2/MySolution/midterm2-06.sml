(* ****** ****** *)

(*
HX: 10 points:
Given an infinite stream:
x1, x2, ..., x_i, ...,
please implement stream_maxize that
constructs another stream y1, y2, ...
such that:
y1 = x1
y2 = the first x_i greater than y1
y3 = the first x_i greater than y2
In general, y_n is the first x_i greater
than the previous y-value.

For instance, let the given stream be
2, 1, 4, 3, 6, 5, 8, 7, ...
Then the constructed stream should be
2, 4, 6, 8, ...

fun
stream_maxize(xs: int stream): int stream
*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-06.sml] *)
