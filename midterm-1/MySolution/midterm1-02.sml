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
Please use int1_foldright to implement the
function fibonacci WITHOUT using recursion.
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is DISQUALIFIED.
//
fun fibonacci_nrec(x: int): int = ...
//
*)

(* ****** ****** *)

(* helper function copied from library  *)
fun int1_foldr(xs: int, r0: 'a, f0: int * 'a -> 'a): 'a =
  if xs <= 0 then r0
  else int1_foldr(xs-1, f0(xs-1, r0), f0)

(* My solution  *)
fun fibonacci_nrec(x: int): int =
  let
    fun fib_helper(n: int, (a, b): (int * int)): (int * int) =
      (b, a + b)

    val (result, _) = int1_foldr(x, (0, 1), fib_helper)
  in
    result
  end



(* I modified the type of the input in the fib_helper function  *)

(* end of [CS320-2024-Sum1-midterm1-02.sml] *)
