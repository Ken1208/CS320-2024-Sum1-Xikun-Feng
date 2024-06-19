(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-12: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () => ...
*)

(* ****** ****** *)

datatype 'a strcon =
  strcon_nil
| strcon_cons of ('a * (unit -> 'a strcon))

type 'a stream = unit -> 'a strcon

fun nat_pairs_at_sum n = fn () =>
  let
    fun aux j = fn () =>
      if j > n then strcon_nil
      else strcon_cons ((j, n - j), aux (j + 1))
  in
    aux 0 ()
  end

fun merge_streams fxs fys = fn () =>
  case fxs () of
    strcon_nil => fys ()
  | strcon_cons (x, fxs') => strcon_cons (x, merge_streams fxs' fys)

fun nat_pairs () =
  let
    fun aux n = fn () =>
      merge_streams (nat_pairs_at_sum n) (aux (n + 1)) ()
  in
    aux 0
  end

val theNatPairs: (int * int) stream = nat_pairs ()



(* end of [CS320-2024-Sum1-assign04-05.sml] *)
