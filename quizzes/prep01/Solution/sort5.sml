(* ****** ****** *)

(*
Implement sort5 that sorts a given tuple of length 5.
Your implementation CANNOT make use of any recursion!!!
*)
(*
fun
sort5
(xs: int * int * int * int * int): int * int * int * int * int
*)

(* ****** ****** *)

(* Please present your code below *)
							       
(* ****** ****** *)

fun
sort2
(xs: int * int): int * int =
let
val (x1, x2) = xs
in
if x1 <= x2
then (x1, x2) else (x2, x1)
end

fun
sort3
(xs: int * int * int): int * int * int =
let
val
(x1, x2, x3) = xs
val (x2, x3) = sort2(x2, x3)
in
  if x1 <= x2 then (x1, x2, x3) else
  let
    val (x1, x3) = sort2(x1, x3) in (x2, x1, x3)
  end
end

fun
sort4
(xs: int * int * int * int): int * int * int * int =
let
val
(x1, x2, x3, x4) = xs
val (x2, x3, x4) = sort3(x2, x3, x4)
in
  if x1 <= x2 then (x1, x2, x3, x4) else
  let
    val (x1, x3, x4) = sort3(x1, x3, x4) in (x2, x1, x3, x4)
  end
end

fun
sort5
(xs: int * int * int * int * int): int * int * int * int * int =
let
val
(x1, x2, x3, x4, x5) = xs
val (x2, x3, x4, x5) = sort4(x2, x3, x4, x5)
in
  if x1 <= x2 then (x1, x2, x3, x4, x5) else
  let
    val (x1, x3, x4, x5) = sort4(x1, x3, x4, x5) in (x2, x1, x3, x4, x5)
  end
end

(* ****** ****** *)

(*
Here is one test:
*)
val xs = (2, 4, 5, 3, 1)
val ys = PolyML.print(sort5(xs))

(* ****** ****** *)

(* end of [quizzes/prep01/sort5.sml] *)
