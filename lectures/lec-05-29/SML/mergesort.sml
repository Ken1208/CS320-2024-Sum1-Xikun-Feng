(* ****** ****** *)

fun
split
( xs: int list
, ys: int list
, zs: int list)
: (int list) * (int list) =
case xs of
  [] => (ys, zs)
| [x1] => (x1 :: ys, zs)
| x1 :: x2 :: xs => split(xs, x1 :: ys, x2:: zs)

(* ****** ****** *)

fun merge
(ys: int list, zs: int list): int list =
case (ys, zs) of
  ([], _) => zs
| (_, []) => ys
| (y1 :: ys2, z1 :: zs2) =>
  if y1 <= z1
  then y1 :: merge(ys2, zs)
  else z1 :: merge(ys, zs2)

(* ****** ****** *)

fun
msort
(xs: int list): int list =
case xs of
  [] => xs
| [x1] => xs
| _(*|xs| >= 2*) =>
  let
    val (ys, zs) = split(xs, [], [])
  in
    merge(msort(ys), msort(zs))
  end
    
(* ****** ****** *)

val mergesort = msort

(* ****** ****** *)

val xs = [2,0,1,3,9,8,6,7,5,4]
val xs = PolyML.print(xs)
val ys = mergesort(xs)
val ys = PolyML.print(ys)

(* ****** ****** *)

(* end of [lectures/lec-05-29/mergesort.sml] *)
