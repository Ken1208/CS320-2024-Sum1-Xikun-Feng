(* ****** ****** *)
use "./../MySolution/assign01-05.sml";
(* ****** ****** *)

local

exception Error
fun
assert(btf: bool): unit =
if not(btf) then raise Error else ()

in (* in-of-local *)

val () = assert(stringrev("") = "")
val () = assert(stringrev("1") = "1")
val () = assert(stringrev("12") = "21")
val () = assert(stringrev("123") = "321")
val () = assert(stringrev("1234") = "4321")
val () = assert(stringrev("12345") = "54321")

(* ****** ****** *)
val () = print("Assign01-05-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-05-test.sml] *)
