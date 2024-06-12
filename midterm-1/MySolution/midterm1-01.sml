(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

(*
HX-2024-06-11: 10 points
Fibonacci numbers can be recursively
defined as follows:
fun fibonacci(x: int): int =
  if x >= 2
  then fibonacci(x-2)+fibonacci(x-1) else x
Please give a direct non-combinator-based
tail-recursive implementation of fibonacci:
//
fun fibonacci_trec(x: int): int = ...
//
PLEASE NOTE THAT YOU CANNOT MAKE NON-TAIL-
RECURSIVE CALLS in your implementation. If you
do, your implementation is DISQUALIFIED.
//
*)

(* ****** ****** *)

fun fibonacci_trec(x: int): int =
  let
    fun helperFun(n: int, a: int, b: int): int =
      if (n = 0) then a
      else helperFun(n - 1, b, a + b)
  in
    helperFun(x, 0, 1)
  end

(* I added an equal sign at the first line  *)


(* end of [CS320-2024-Sum1-midterm1-01.sml] *)
