(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* ****** ****** *)

fun stream_ziplst (strlst: 'a stream list): 'a list stream =
    let
        fun get_column i =
            let
                fun collect (acc, s) = (stream_get_at (s, i)) :: acc
                val collected = foreach_to_foldleft (list_foreach) (strlst, [], collect)
            in
                list_reverse collected
            end

        fun min_length lst =
            let
                fun aux ([], min_len) = min_len
                  | aux (s::ss, min_len) =
                      let val len = stream_length s
                      in aux (ss, if len < min_len then len else min_len)
                      end
                val initial_min_len = 1000000
            in
                aux (lst, initial_min_len)
            end

    in
        stream_tabulate (min_length strlst, get_column)
    end




(* end of [CS320-2024-Sum1-assign04-08.sml] *)
