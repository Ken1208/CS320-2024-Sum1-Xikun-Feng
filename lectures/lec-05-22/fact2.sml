(* ****** ****** *)
(*
HX-2024-05-21:
A basic recursive implementation
of the factorial function.
*)
(* ****** ****** *)

fun fact_trec(n: int): int =
let
    fun
    loop(n: int, res: int): int =
    if n > 0
    then loop(n-1, n * res) else res
in
    loop(n, 1)
end

(* ****** ****** *)
val fact10_trec = fact_trec(10)
(* ****** ****** *)

(* end of [lectures/lec-05-22/fact.sml] *)
