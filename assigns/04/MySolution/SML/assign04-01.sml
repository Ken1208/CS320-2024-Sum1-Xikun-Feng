(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-01: 20 points
Recall that a reference is precisely an array
of size 1. And it can be treated as a sequence.
For instance, we can define ref_foreach as follows
*)

(* ****** ****** *)

fun
ref_foreach
(r0: 'a ref, work: 'a -> unit): unit = work(!r0)

(* ****** ****** *)

(*
Please implement directly the following combinators
for for references. That is, your implementation should
not make use of any third-order functions defined in the
library for this class.
*)

(* ****** ****** *)

(*
fun
ref_get_at
(ref: 'a ref, i: int): 'a
fun
ref_forall
(ref: 'a ref, test: 'a -> bool): bool
fun
ref_map_list
(ref: 'a ref, fopr: ('a) -> 'b): 'b list
fun
ref_foldleft
(ref: 'a ref, res: 'r, fopr: ('r * 'a) -> 'r): 'r
fun
ref_ifoldleft
(ref: 'a ref, res: 'r, fopr: ('r * int * 'a) -> 'r): 'r
*)

(* ****** ****** *)

fun ref_get_at (r: 'a ref, i: int): 'a =
  if i = 0 then
    !r
  else
    raise Subscript

fun ref_forall (r: 'a ref, test: 'a -> bool): bool =
  test (!r)

fun ref_map_list (r: 'a ref, f: 'a -> 'b): 'b list =
  [f (!r)]

fun ref_foldleft (r: 'a ref, res: 'r, f: ('r * 'a) -> 'r): 'r =
  f (res, !r)

fun ref_ifoldleft (r: 'a ref, res: 'r, f: ('r * int * 'a) -> 'r): 'r =
  f (res, 0, !r)


(* end of [CS320-2024-Sum1-assign04-01.sml] *)
