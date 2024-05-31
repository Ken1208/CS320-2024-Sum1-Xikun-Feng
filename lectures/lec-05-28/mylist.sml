(* ****** ****** *)
(*
This one is monomorphic
*)
datatype
mylist =
  mynil (* empty *)
| mycons of int * mylist (* non-empty *)
(* ****** ****** *)
(*
val mynil: mylist
fun mycons: int * mylist -> mylist
*)
(* ****** ****** *)

fun
mylist_sing
(x: int): mylist =
mycons(x, mynil)

val xs = mylist_sing(10)

(* ****** ****** *)
(*
This one is polymorphic
*)
datatype
'a mylist =
  mynil (* empty *)
| mycons of 'a * 'a mylist (* non-empty *)

fun
mylist_sing
(x: 'a): 'a mylist =
mycons(x, mynil)

val xs1 = mylist_sing(10)
val xs2 = mylist_sing("10")

fun
mylist_range
(n: int): int mylist =
if n <= 0
then
  mynil
else
  mycons(n, mylist_range(n-1))

(* ****** ****** *)
(*
val a_very_long_list = mylist_range(1000000)
*)
(* ****** ****** *)

fun
mylist_append
(xs: 'a mylist, ys: 'a mylist): 'a mylist =
case xs of
  mynil => ys
| mycons(x1, xs) => mycons(x1, mylist_append(xs, ys))

(* ****** ****** *)

val xs3 = mylist_append(xs2, xs2)

(* ****** ****** *)
fun
mylist_reverse
(xs: 'a mylist): 'a mylist = mylist_rappend(xs, mynil)
(* ****** ****** *)
and
mylist_rappend
(xs: 'a mylist, ys: 'a mylist): 'a mylist =
case xs of
  mynil => ys
| mycons(x1, xs) => mylist_rappend(xs, mycons(x1, ys))
(* ****** ****** *)

val xs4 = mylist_range(5)
val xs5 = mylist_reverse(xs4)

val xs6 = PolyML.print("xs5 = ", xs5)

(* ****** ****** *)

(* end of [lectures/lec-05-28/mylist.sml] *)
