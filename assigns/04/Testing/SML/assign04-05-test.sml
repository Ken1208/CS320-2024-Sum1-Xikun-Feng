(* ****** ****** *)
use
"./../../MySolution/SML/assign04-05.sml";
(* ****** ****** *)

local

exception ERROR_assign04_05

fun
myassert
(claim: bool): unit =
if claim
then () else raise ERROR_assign04_05

in (* in-of-local *)

(* ****** ****** *)

fun
check1
( ij: int
, fxs: (int*int) stream): int =
let
val
strcon_cons((i, j), fxs) = fxs()
in
  if i + j < ij
  then (i+j) + check1(ij, fxs) else 0
end

(* ****** ****** *)
val () =
(
print("check1(1) = ");
print(int2string(check1(1, theNatPairs))); print("\n"))
val () =
(
print("check1(2) = ");
print(int2string(check1(2, theNatPairs))); print("\n"))
val () =
(
print("check1(3) = ");
print(int2string(check1(3, theNatPairs))); print("\n"))
(* ****** ****** *)
val () =
(
print("check1(9) = ");
print(int2string(check1(9, theNatPairs))); print("\n"))
(* ****** ****** *)
val () =
(
print("check1(10) = ");
print(int2string(check1(10, theNatPairs))); print("\n"))
val () =
(
print("check1(11) = ");
print(int2string(check1(11, theNatPairs))); print("\n"))
(* ****** ****** *)
val () =
myassert(check1(9, theNatPairs) = 240)
(* ****** ****** *)
val () =
myassert(check1(10, theNatPairs) = 330)
(* ****** ****** *)
val () =
myassert(check1(11, theNatPairs) = 440)
(* ****** ****** *)
val () = print("Assign04-05-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-05-test.sml] *)
