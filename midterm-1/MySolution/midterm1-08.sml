(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
(*
//
// HX-2024-06-11: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence [a,b,c] of xs
satisfying c < a < b. NOTE that a, b, and c
do not have to appear consecutively in xs.
//
For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
//
fun
perm_capture_231(xs: int list): bool = ...
//
*)
(* ****** ****** *)

fun perm_capture_231(xs: int list): bool =
  let
    (* Modifed the helper function check_231 *)
    fun check_231([], _) = false
      | check_231(x::xs, min_stack) =
          let
            val min_c = foldl (fn (m, v) => if v < m then v else m) x min_stack
          in
            if List.exists (fn b => b > x andalso x > min_c) min_stack then true
            else check_231(xs, x::min_stack)
          end
  in
    check_231(xs, [])
  end;

(* end of [CS320-2024-Sum1-midterm1-08.sml] *)
