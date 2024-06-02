fun
foldleft
(xs: 'a list, r0: 'b, f0: 'b * 'a -> 'b): 'b =
case xs of [] => r0 | x1 :: xs => foldleft(xs, f0(r0, x1), f0)

val length = fn(xs: 'a list) => foldleft(xs, 0, fn(r0, _) => r0+1)
val xs = [0,1,2,3,4,5,6,7,8,9]
val len = length(xs)

(*
  syntactic sugar
*)
val
rec length1 =
fn(xs: 'a list) =>
  case xs of
    [] => 0
  | _ :: xs => 1 + length1(xs)
val len1 = length1(xs)

(*
fun
foreach
(xs: 'a list, work: 'a -> unit): unit =
case xs of
  [] => ()
| x1 :: xs =>
let val _ = work(x1) in foreach(xs, work) end
*)

fun foreach
(xs: 'a list, work: 'a -> unit): unit =
foldleft(xs, (), fn(r0, x1) => work(x1))

val () = foreach(xs, fn(x: int) => (PolyML.print(x); ()))
