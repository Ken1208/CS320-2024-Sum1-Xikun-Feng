(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

(* ****** ****** *)

(*
fun
xlist_size
(xs: 'a xlist): int = raise NotImplemented320
*)

(* ****** ****** *)

(*
datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ( 'a xlist )
*)

fun xlist_foreach
(xs: 'a xlist, work: 'a -> unit): unit =
let
fun
worklst(xs: 'a xlist): unit =
case xs of
xlist_nil => ()
|
xlist_cons(x1, xs) => (work(x1); worklst(xs))
|
xlist_snoc(xs, x1) => (worklst(xs); work(x1))
|
xlist_append(xs, ys) => (worklst(xs); worklst(ys))
|
xlist_reverse(xs) => rworklst(xs)

and
rworklst(xs: 'a xlist): unit =
case xs of
xlist_nil => ()
|
xlist_cons(x1, xs) => (rworklst(xs); work(x1))
|
xlist_snoc(xs, x1) => (work(x1); rworklst(xs))
|
xlist_append(xs, ys) => (rworklst(ys); rworklst(xs))
|
xlist_reverse(xs) => worklst(xs)
in
    worklst(xs)
end

(* ****** ****** *)

fun
foreach_to_foldleft
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * 'r0 * ('r0*'x0 -> 'r0)) -> 'r0 =
fn(xs, r0, fopr) =>
let
val res = ref(r0)
in
foreach
( xs
, fn(x0) => res := fopr(!res, x0)); !res
end (* end of [foreach_to_foldleft]: let *)

(* ****** ****** *)

fun
foldleft_to_length
( foldleft
: ('xs * int * (int*'x0 -> int)) -> int)
: ('xs -> int) =
fn(xs: 'xs) => foldleft(xs, 0, fn(r0,x0) => r0+1)

(* ****** ****** *)

fun
foreach_to_length(foreach) =
foldleft_to_length(foreach_to_foldleft(foreach))

(* ****** ****** *)

fun
xlist_size(xs) = foreach_to_length(xlist_foreach)(xs)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-01.sml] *)

			    
