(* ****** ****** *)
use
"./../../MySolution/SML/assign03-07.sml";
(* ****** ****** *)

local

exception
Error320 of string option

in (* in-of-local *)

(* ****** ****** *)

fun
power
(x: int, y: int): int =
if x > 0 then x * power(x-1, y) else 1

(* ****** ****** *)
fun
assert320
(claim: bool): unit =
if claim
  then () else raise Error320(NONE)
(* end of [assert320] *)

fun
assert320_some
(claim: bool, errmsg: string): unit =
if claim
  then () else raise Error320(SOME(errmsg))
(* end of [assert320_some] *)
(* ****** ****** *)

fun
list_forall(xs, test) =
case xs of
  [] => true
| x1 :: xs =>
  if test(x1)
  then list_forall(xs, test) else false

(* ****** ****** *)

val
list_exists =
fn(xs, test) => forall_to_exists(list_forall)(xs, test)
val
list_forall' =
fn(xs, test) => forall_to_exists(list_exists)(xs, test)
val
list_exists' =
fn(xs, test) => forall_to_exists(list_forall')(xs, test)

(* ****** ****** *)

val xs = [1,2,3,4,5]
val p1 = fn(x) => (x < 6)
val p2 = fn(x) => (x > 2)
val p3 = fn(x) => (x = 2)
val p4 = fn(x) => (x = 6)
val ( ) =
assert320_some
(list_forall(xs, p1) = true, "assign03-07-test:01")
val ( ) =
assert320_some
(list_exists(xs, p2) = true, "assign03-07-test:02")
val ( ) =
assert320_some
(list_exists
 (xs, fn(x) => not(p1(x))) = false, "assign03-07-test:03")
val ( ) =
assert320_some
(list_forall
 (xs, fn(x) => not(p2(x))) = false, "assign03-07-test:04")
val ( ) =
assert320_some
(list_forall(xs, p1) = list_forall'(xs, p1), "assign03-07-test:1")
val ( ) =
assert320_some
(list_forall(xs, p2) = list_forall'(xs, p2), "assign03-07-test:2")
val ( ) =
assert320_some
(list_exists(xs, p1) = list_exists'(xs, p1), "assign03-07-test:3")
val ( ) =
assert320_some
(list_exists(xs, p2) = list_exists'(xs, p2), "assign03-07-test:4")
val ( ) =
assert320_some
(list_exists(xs, p3) = list_exists'(xs, p3), "assign03-07-test:5")
val ( ) =
assert320_some
(list_exists(xs, p4) = list_exists'(xs, p4), "assign03-07-test:6")

(* ****** ****** *)
val () = print("Assign03-07-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-07-test.sml] *)
