(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)

fun list_longest_ascend(xs: int list): int list=
let
    fun helper(xs:int list,lastnum:int,currentlist:int list):int list=
        let
          val (x1::xs)=xs
        in
          if (xs=nil andalso x1<lastnum) then currentlist
          else if (xs=nil andalso x1>=lastnum) then currentlist@[x1]
          else if (x1>=lastnum) then
            let
            val temp1= helper(xs,x1,currentlist@[x1])
            val temp2=helper(xs,lastnum,currentlist)
            in
                if list_length(temp1)>= list_length(temp2)(*Keep it, drop it*)
                then temp1 else temp2
                end
          else
            let
            val temp3=helper(xs,x1,[x1])
            val temp4=helper(xs,lastnum,currentlist)
            in
            if list_length(temp3)> list_length(temp4)
            then temp3 else temp4
            end
        end

        in
        case xs of
            nil => []
        | x1::xs => helper(xs,x1,[x1])
        end

(* end of [CS320-2024-Sum1-assign03-04.sml] *)
