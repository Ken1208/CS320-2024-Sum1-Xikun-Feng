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

fun xlist_size(xs: 'a xlist): int =
    case xs of
         xlist_nil => 0
       | xlist_cons(x1, xs) => 1 + xlist_size(xs)
       | xlist_append(x1, xs) => xlist_size(x1) + xlist_size(xs)
       | xlist_reverse(x1) => xlist_size(x1)
       | xlist_snoc(xs, x1) => 1 + xlist_size(xs)

exception XlistSubscript

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
let
fun sub ((xs: 'a xlist), (i: int)) : 'a =
  (case xs of
     xlist_nil => raise XlistSubscript
   | xlist_cons (x, xs) => if i = 0 then x else sub (xs, i - 1)
   | xlist_snoc (xs, x) =>
       let
         val len = xlist_size xs
       in
         if i = len then x
         else if i < len then sub (xs, i)
         else raise XlistSubscript
       end
   | xlist_append (xs1, xs2) =>
       let
         val len1 = xlist_size xs1
       in
         if i < len1 then sub (xs1, i)
         else sub (xs2, i - len1)
       end
   | xlist_reverse xs =>
       let
         val len = xlist_size xs
       in
         if i < len then sub (xs, len - 1 - i)
         else raise XlistSubscript
       end)
in
if i0 < 0 then raise XlistSubscript
else sub (xs, i0)
end
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-02.sml] *)
