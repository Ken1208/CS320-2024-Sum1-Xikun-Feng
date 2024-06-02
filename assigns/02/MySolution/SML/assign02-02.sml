(* ****** ****** *)
use "./../../assign02-lib.sml";
(* ****** ****** *)
(*
Please manually copy your implementation
of xlist_size if you need it:
use "./../../MySolution/SML/assign02-01.sml";
*)
(* ****** ****** *)

(*
//
Assign02-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)

fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = raise NotImplemented320

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-02.sml] *)
