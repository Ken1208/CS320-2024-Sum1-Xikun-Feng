fun
foldright
(xs: 'a list, r0: 'b, f0: 'a * 'b -> 'b): 'b =
case xs of [] => r0 | x1 :: xs => f0(x1, foldright(xs, r0, f0))

val xs = [0,1,2,3,4,5,6,7,8,9]

fun rforeach
(xs: 'a list, work: 'a -> unit): unit =
foldright(xs, (), fn(x1, r0) => work(x1))

val () = rforeach(xs, fn(x: int) => (PolyML.print(x); ()))

fun rforall
(xs: 'a list, test: 'a -> bool): bool =
foldright(xs, true, fn(x1, r0) => if r0 then test(x1) else false)
