(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
(*
Given a list of integers xs,
please implement a function that computes
the maximum sum of a consecutive sublist of xs:

fun
sublist_max_sum(xs: int list): int

Yes, the integers in xs can be negative.

You can use unrestricted recursion to solve this problem.
*)
(* ****** ****** *)

fun sublist_max_sum(xs: int list): int =
  let
    (* Add the helper function max *)
    fun max(a: int, b: int) = if a > b then a else b

    fun helperFun([], currentMax, globalMax) = globalMax
      | helperFun(x::xs, currentMax, globalMax) =
          let
            (* I modified the definition of these two variables *)
            val newCurrentMax = max(x, currentMax + x)
            val newGlobalMax = max(globalMax, newCurrentMax)
          in
            helperFun(xs, newCurrentMax, newGlobalMax)
          end
  in
    case xs of
         [] => 0
       | x::xs => helperFun(xs, x, x)
  end;

(* end of [CS320-2024-Sum1-midterm1-07.sml] *)
