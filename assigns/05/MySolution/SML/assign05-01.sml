(* ****** ****** *)
use "./../../assign05-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-14: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

fun
stream_permute_list(xs: 'a list): 'a list stream =
  let
    fun list_insert(x, []) = [[x]]
      | list_insert(x, y::ys) =
        let
          val insert = x :: y :: ys
          val mapped = list_map (list_insert(x, ys), fn ys => y :: ys)
        in
          insert :: mapped
        end

    fun permutate_helper [] = list_streamize [[]]
      | permutate_helper (x::xs) =
        stream_concat (stream_map (permutate_helper xs, fn x1 => list_streamize (list_insert(x, x1))))
  in
    permutate_helper xs
  end

(* end of [CS320-2024-Sum1-assign05-01.sml] *)
