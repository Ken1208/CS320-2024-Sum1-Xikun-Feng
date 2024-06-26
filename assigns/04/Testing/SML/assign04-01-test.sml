(* ****** ****** *)
use
"./../../MySolution/SML/assign04-01.sml";
(* ****** ****** *)

local

exception ERROR_assign04_01

fun
myassert
(claim: bool): unit =
if claim
then () else raise ERROR_assign04_01    

in (* in-of-local *)

(* ****** ****** *)
val xref0 = ref(0)
val xref1 = ref(1)
val xref2 = ref(2)
(* ****** ****** *)
val () =
myassert
(
ref_get_at(xref0, 0) =
foreach_to_get_at(ref_foreach)(xref0, 0))
val () =
myassert
(
(ref_get_at(xref1, 1)
 handle Subscript => 1) =
 foreach_to_get_at(ref_foreach)(xref1, 0))
(* ****** ****** *)
val () =
myassert(ref_forall(xref0, fn x => x = 0))
val () =
myassert(ref_forall(xref1, fn x => x > 1) = false)
(* ****** ****** *)
val () =
myassert(hd(ref_map_list(xref2, fn x => x * x)) = 4)
(* ****** ****** *)
val () =
myassert(ref_foldleft(xref2, 10, fn (r0, x) => r0 + x * x) = 14)
(* ****** ****** *)
val () =
myassert(ref_ifoldleft(xref2, 10, fn (r0, i, x) => r0 + 2*(i+1) * x * x) = 18)
(* ****** ****** *)
val () = print("Assign04-01-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-01-test.sml] *)
