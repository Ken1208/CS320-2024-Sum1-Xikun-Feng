(* ****** ****** *)
(*
HX: The total points = 10
*)
(* ****** ****** *)

(*
fun f91(x) =
if x > 100 then x - 100 else f91(f91(x+11))
*)

1. How many recursive calls are in the body of
the above function? (1 point)

2. How many tail-recursive calls are in the body of (1 point)
the above function?

3. Is the above implementation of f91 tail-recursive? (1 point)

(* ****** ****** *)
(* ****** ****** *)

fun ghaap
(
  m: int, res: int
) : int =
(
  if m >= 0 then ghaap (m-1, m*res) else res
) // end of [ghaap]

4. What is the value of ghaap(5, 5)? (2 points)

(* ****** ****** *)
(* ****** ****** *)

Let us define the following function f:

fun foo(x: int): int =
(if x >= 0 then foo(2*x+1) else x) * x

5. What is the value of f(0)? (1 points)

(* ****** ****** *)
(* ****** ****** *)

val global: int = 0

val
tricky =
let
  fun f(i: int) : int =
  let
    val global = global + i
  in
    if i < 10 then f(i+1) else global
  end
in
  f (0)
end

6. What is the value of tricky? (3 points)

(* ****** ****** *)
(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm1-03.sml] *)
