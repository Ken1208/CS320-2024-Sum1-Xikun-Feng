(* ****** ****** *)

fun
split
( pt: int
, xs: int list
, ys: int list
, zs: int list)
: (int list) * (int list) =
case xs of
  [] => (ys, zs)
| x1 :: xs =>
  if x1 <= pt
  then split(pt, xs, x1 :: ys, zs)
  else split(pt, xs, ys, x1 :: zs)

(* ****** ****** *)

fun
qsort
(xs: int list): int list =
case xs of
  [] => []
| x1 :: xs =>
  let
    val (ys, zs) = split(x1, xs, [], [])
  in
    qsort(ys) @ (x1 :: qsort(zs))
  end

(* ****** ****** *)

val quicksort = qsort

(* ****** ****** *)

val xs = [2,0,1,3,9,8,6,7,5,4]
val xs = PolyML.print(xs)
val ys = quicksort(xs)
val ys = PolyML.print(ys)

(* ****** ****** *)

(* end of [lectures/lec-05-29/quicksort.sml] *)
