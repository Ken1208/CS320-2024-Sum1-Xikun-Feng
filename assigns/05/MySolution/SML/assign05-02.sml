(* ****** ****** *)
use "./../../assign05-lib.sml";
(* ****** ****** *)

(*
//
HX-2024-06-14: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () => ...
//
*)

(* ****** ****** *)

val theNatPairs_cubesum: (int * int) stream =
  let
    fun cube(n: int): int = n * n * n

    fun stream_helper(num: int, start: int, fopr: int -> 'a): 'a stream =
      let
        fun helper1(i: int): 'a stream = fn () =>
              strcon_cons(fopr(i), helper1(i + 1))

        fun helper2(i: int): 'a stream = fn () =>
              if i >= num then
                strcon_nil
              else
                strcon_cons(fopr(i), helper2(i + 1))
      in
        if num < 0 then
          helper1(start)
        else
          helper2(start)
      end

    fun generate_stream_pairs(n: int): (int * int) stream =
      stream_helper (~1, n, fn (i) => (n, i))

    fun helper(nth_pair: int): (int * int) stream = fn () =>
      strcon_cons((0, nth_pair), stream_merge2(
        generate_stream_pairs(nth_pair),
        helper(nth_pair + 1),
        fn ((i1, j1), (i2, j2)) =>
          cube(i1) + cube(j1) <= cube(i2) + cube(j2)
      ))
  in
    stream_cons((0, 0), helper 1)
  end

(* end of [CS320-2024-Sum1-assign05-02.sml] *)
